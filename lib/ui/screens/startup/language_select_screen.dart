import 'package:flutter/material.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelectScreen extends StatelessWidget {
  const LanguageSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.fromLTRB(w*0.05, h*0.03, w*0.05, h*0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: SizedBox(
                        height: w*0.08,
                        child:
                            Image.asset('assets/images/icons/back_yellow.png'),
                      ),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                _header(),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, h*0.02, 0, 0),
                  child: Center(
                      child: Text(
                    "Select Language",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )),
                ),
                Column(
                  children: [
                    _button("नेपाली"),
                    _button("English"),
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
        bottom: -h*0.05,
        child: Container(
          height: h*0.16,
          child: Image.asset('assets/images/lang.png'),
        ),
      )
    ],
    overflow: Overflow.visible,
  );
}

Widget _button(String language) {
  return MaterialButton(
    shape: const StadiumBorder(),
    onPressed: () {
      SharedPreferences.getInstance().then((value) {
        value.setString('savedLocale', language);
        print(language);
      });
    },
    child: Padding(
      padding: EdgeInsets.all(w*0.03),
      child: Ink(
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: w*0.01,
                color: Colors.limeAccent.withOpacity(0.3),
                offset: Offset(0, 0),
                spreadRadius: w*0.02,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(w*0.08)),
            gradient: LinearGradient(
                colors: [AppColors.lightYellow, AppColors.darkYellow])),
        width: w / 2,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0,h*0.02, 0, h*0.02),
          child: Text(
            language,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: w*0.06, fontWeight: FontWeight.bold),
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
              height: h*0.06,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, h*0.02, 0, h*0.01),
                child: Text(
                  "Signup",
                  textAlign: TextAlign.center,style: TextStyle(fontSize: w*0.03),
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
            height: h*0.06,
            minWidth: w / 4,
            color: Colors.white10,
            onPressed: () {
              Navigator.pushNamed(context, loginScreenRoute);
            },
            child: Text("Login",style: TextStyle(fontSize: w*0.03),),
          ),
        ),
      ],
    ),
  );
}
