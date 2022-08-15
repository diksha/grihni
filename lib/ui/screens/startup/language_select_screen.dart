import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_svg/svg.dart';
import 'package:junkiri/ui/shares/router_names.dart';
import 'package:junkiri/services/locale_provider.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSelectScreen extends ConsumerWidget {
  const LanguageSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.btnLightYellow,
                Colors.white,
              ], stops: const [
                0,
                0.4
              ]),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(w * 0.05, h * 0.03, w * 0.05, h * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: SizedBox(
                        height: w * 0.08,
                        child:
                            Image.asset('assets/images/icons/back_yellow.png'),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                _header(),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, h * 0.02, 0, 0),
                  child: Center(
                      child: Text(
                    AppLocalizations.of(context)!.selectLanguage,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )),
                ),
                Column(
                  children: [
                    _button(watch, context, "नेपाली"),
                    _button(watch, context, "English"),
                  ],
                ),
                _buttonBar(context)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _header() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        child: Image.asset('assets/images/world.png'),
      ),
      Positioned(
        bottom: -h * 0.02,
        child: Container(
          height: h * 0.16,
          child: SvgPicture.asset('assets/images/svg/lang.svg'),
        ),
      )
    ],
  );
}

Widget _button(ScopedReader watch, BuildContext context, String language) {
  final locale = watch(localeProvider);
  return MaterialButton(
    shape: const StadiumBorder(),
    onPressed: () {
      if (language == "English") {
        locale.setEnglish();
      }
      if (language == "नेपाली") {
        locale.setNepali();
      }

      SharedPreferences.getInstance().then((value) {
        value.setString('savedLocale', language);
      });
    },
    child: Padding(
      padding: EdgeInsets.all(w * 0.03),
      child: Ink(
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: w * 0.01,
                color: Colors.white60.withOpacity(0.8),
                offset: Offset(0, 0),
                spreadRadius: w * 0.02,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(w * 0.08)),
            gradient: LinearGradient(
                colors: [AppColors.lightYellow, AppColors.darkYellow])),
        width: w / 2,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, h * 0.02, 0, h * 0.02),
          child: Text(
            language,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: w * 0.06,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}

Widget _buttonBar(context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, signupScreenRoute);
            },
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  gradient: LinearGradient(
                      colors: [AppColors.lightYellow, AppColors.darkYellow])),
              width: w / 4,
              height: h * 0.06,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, h * 0.02, 0, h * 0.01),
                child: Text(
                  AppLocalizations.of(context)!.signup,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: w * 0.04),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            elevation: 0.001,
            height: h * 0.06,
            minWidth: w / 4,
            color: Colors.white10,
            onPressed: () {
              Navigator.pushNamed(context, loginScreenRoute);
            },
            child: Text(
              AppLocalizations.of(context)!.login,
              style: TextStyle(fontSize: w * 0.04),
            ),
          ),
        ),
      ],
    ),
  );
}
