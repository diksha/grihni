import 'package:flutter/material.dart';
import 'package:junkiri/constants/router_constants.dart';
import 'package:junkiri/ui/screens/language_select_screen.dart';
import 'package:junkiri/ui/screens/startup_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case startupScreenRoute:
      return MaterialPageRoute(builder: (context) => const StartupScreen());
    case languageSelectScreenRoute:
      return MaterialPageRoute(builder: (context) => const LanguageSelectScreen());
    default:
      return MaterialPageRoute(builder: (context) => const StartupScreen());
  }
}