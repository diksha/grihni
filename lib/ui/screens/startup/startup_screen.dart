import 'package:flutter/material.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/shares/app_strings.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';
class StartupScreen extends StatelessWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset('assets/images/background003.png'),
          ),
          SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(w*0.05, h*0.1, w*0.05,h*0.1 ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: h*0.3,
                        child: Image.asset('assets/images/logo.png'),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StartupStrings.greeting,
                            style: TextStyle(
                              fontSize: w*0.045,
                            ),
                          ),
                          SizedBox(
                            height: h*0.01,
                          ),
                          Text(
                            StartupStrings.phrase1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: w*0.03,
                            ),
                          ),
                          SizedBox(
                            height: h*0.01,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                StartupStrings.phrase2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: w*0.03,
                                ),
                              ),
                              Text(
                                StartupStrings.phrase3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: w*0.03,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h*0.015,
                          ),
                          MaterialButton(
                            elevation: 0,
                            onPressed: () {

                              Navigator.pushNamed(context, languageSelectScreenRoute);

                            },
                            shape:const StadiumBorder(),
                            child: Ink(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(const Radius.circular(80.0)),
                                  gradient:
                                  LinearGradient(colors: [AppColors.btnLightYellow, AppColors.btnDarkYellow])),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(w*0.09, 10, w*0.09, 10),
                                child: Text(
                                  "CLICK HERE",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: w*0.04,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                          )
                        ],
                      ),

                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
