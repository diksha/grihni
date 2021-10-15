import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:junkiri/services/locale_provider.dart';
import 'package:junkiri/ui/router.dart' as router;
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/router_names.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String savedLocale = 'en';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SharedPreferences.getInstance().then((value) async  {
    isFirstTime = value.getBool('isFirstTime') ?? true;
    savedLocale = value.getString('savedLocale') ?? 'en';
    currentUser = value.getString('currentUid') ?? '';
  });

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ProviderScope(child: MyApp()), // Wrap your app
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch)  {
    final locale = watch(localeProvider);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(// Add the locale here
      builder: DevicePreview.appBuilder,
      title: 'Grihini App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: isFirstTime ? startupScreenRoute: taskDetailsScreenRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale.currentLocale,

    );
  }
}
