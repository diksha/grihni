import 'package:flutter/material.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/ui/shares/app_strings.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';
class StartupScreen extends StatelessWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: yellowGradient(),
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 90.0,
                        child: ClipRRect(
                          child: Image.asset('assets/images/logo.png'),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 1,
                        width: 120,
                        color: Colors.white,
                      ),

                    ],
                  ),

                  Column(
                    children: [
                      Text(
                        StartupStrings.greeting,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        StartupStrings.phrase1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StartupStrings.phrase2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            StartupStrings.phrase3,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  MaterialButton(
                    elevation: 0,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, signupScreenRoute);
                    },
                    shape:const StadiumBorder(),
                    child: Ink(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(const Radius.circular(80.0)),
                          gradient:
                          LinearGradient(colors: [AppColors.btnLightYellow, AppColors.btnDarkYellow])),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text(
                          "CLICK HERE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                  )
                ],
              ),
            )),
      ),
    );
  }
}
