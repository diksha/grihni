import 'package:flutter/material.dart';
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
                  Center(child: const Text("Select Language")),
                  _buttonBar(),
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

Widget _buttonBar() {
  return Column(
    children: [
      ElevatedButton(
        onPressed: () {},
        child: Text("English"),
      )
    ],
  );
}
