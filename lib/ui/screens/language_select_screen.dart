import 'package:flutter/material.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/ui/shares/app_colors.dart';

class LanguageSelectScreen extends StatelessWidget {
  const LanguageSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        child:
                            Image.asset('assets/images/icons/back_yellow.png'),
                      ),
                    ],
                  ),
                  _header(height, width),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                      _button(" नेपाली "),
                      SizedBox(
                        height: 10,
                      ),
                      _button("English"),
                    ],
                  ),

                  _buttonBar(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _header(height, width) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        child: Image.asset('assets/images/world.png'),
      ),
      Positioned(
        bottom: -50,
        child: Container(
          height: 170,
          child: Image.asset('assets/images/lang.png'),
        ),
      )
    ],
    overflow: Overflow.visible,
  );
}

Widget _button(String str) {
  return Column(
    children: [
      MaterialButton(
        color: Colors.amber,
        shape: const StadiumBorder(),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Text(
            "$str",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      )
    ],
  );
}

Widget _buttonBar(context) {
  return ButtonBar(
    alignment: MainAxisAlignment.center,
    children: [
      MaterialButton(
        color: Colors.amber,
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, signupScreenRoute);
        },
        child: const Text("Signup"),
      ),
      MaterialButton(
        color: Colors.amber,
        onPressed: () {},
        child: const Text("Login"),
      ),
    ],
  );
}
