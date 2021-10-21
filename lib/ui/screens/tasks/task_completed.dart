import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';

class TaskCompleted extends ConsumerWidget {
  final Task task;
  const TaskCompleted({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h,
            decoration: whiteGradient(),
          ),
          Positioned(
            top: 0,
            width: w,
            child: Container(
              height: h * 0.8,
              decoration: yellowGradient(),
            ),
          ),
          Container(
            height: h * 0.18,
            child: appBar(context, watch),
          ),
          Positioned(
            width: w,
            top: h * 0.15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(w * 0.01),
                  child: Text(
                    AppLocalizations.of(context)!.jobCompleted(task.jobId),
                    style: TextStyle(
                        fontSize: w * 0.06, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(w * 0.05),
                      child: SizedBox(
                        child: SvgPicture.asset("assets/images/svg/completed.svg"),
                        height: w * 0.5,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.all(w * 0.02),
                      child: Text(
                        AppLocalizations.of(context)!.collectAchaarSoon,
                        style: TextStyle(
                            fontSize: w * 0.06, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.08,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: h * 0.2,
                          width: w * 0.78,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, taskDetailsScreenRoute);
                                },
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        child: Image.asset("assets/images/icons/pending_tasks.png"),
                                        height: w * 0.18,
                                      ),
                                      Text(AppLocalizations.of(context)!
                                          .myPendingTasks),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, taskDetailsScreenRoute);
                                },
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        child: Image.asset("assets/images/icons/new_tasks.png"),
                                        height: w * 0.18,
                                      ),
                                      Text(AppLocalizations.of(context)!
                                          .newTasks),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: -25,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, homeScreenRoute);
                            },
                            child: Ink(
                              decoration: yellowGradient(),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    w * 0.08, h * 0.01, w * 0.08, h * 0.01),
                                child: Text(
                                  AppLocalizations.of(context)!.home,
                                  style:
                                  TextStyle( fontSize: w * 0.055),
                                ),
                              ),
                            ),
                            elevation: 0,
                          ),
                        )
                      ],
                      overflow: Overflow.visible,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
