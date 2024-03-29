import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/router_names.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          Container(
            width: w,
            height: h,
            decoration: yellowGradient(),
          ),
          Positioned(
            top: 0,
            left: -w,
            height: h * 0.6,
            right: -w,
            child: Image.asset('assets/images/background002.png'),
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.fromLTRB(w * 0.05, h * 0.1, w * 0.05, h * 0.1),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: h * 0.3,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.namasteDesna,
                        style: TextStyle(
                          fontSize: w * 0.045,
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Text(
                        AppLocalizations.of(context)!.statupDes,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: w * 0.03,
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.tagLinePart1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: w * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          Text(
                            AppLocalizations.of(context)!.tagLinePart2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: w * 0.03,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.015,
                      ),
                      MaterialButton(
                        elevation: 0,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, languageSelectScreenRoute);
                        },
                        shape: const StadiumBorder(),
                        child: Ink(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(80.0)),
                              gradient: LinearGradient(colors: [
                                AppColors.btnLightYellow,
                                AppColors.btnDarkYellow
                              ])),
                          child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(w * 0.09, 10, w * 0.09, 10),
                            child: Text(
                              AppLocalizations.of(context)!.clickHere,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: w * 0.04,
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
