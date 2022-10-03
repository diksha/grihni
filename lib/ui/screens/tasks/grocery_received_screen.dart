import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:junkiri/ui/shares/router_names.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar_without_back_button.dart';
import 'package:junkiri/ui/widgets/app_bar_yellow.dart';
import 'package:junkiri/ui/widgets/bottom_navigation_two.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroceryReceived extends ConsumerWidget {
  final Task task;
  final Grihini grihini;
  const GroceryReceived({Key? key, required this.task, required this.grihini})
      : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    FirestoreService fireService = FirestoreService();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h,
            decoration: whiteGradient(),
          ),
          Container(
            height: h * 0.18,
            child: appBarWithoutBackButton(context, watch),
          ),
          Positioned(
            width: w,
            top: h * 0.18,
            bottom: h * 0.11,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      child: Image.asset("assets/images/job.png"),
                      height: h * 0.15,
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Text(
                      AppLocalizations.of(context)!.job(task.jobId),
                      style: TextStyle(
                          fontSize: w * 0.06, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(w * 0.08),
                  child: Text(
                    AppLocalizations.of(context)!
                        .groceriesforlapsireceived(task.amount),
                    style: TextStyle(
                      fontSize: w * 0.07,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                MaterialButton(
                  onPressed: () async {
                    await fireService.startTask(task).whenComplete(() =>
                        Navigator.pushReplacementNamed(
                            context, taskStepYoutubeScreenRoute,
                            arguments: [task, grihini]));
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(w * 0.4)),
                        gradient: LinearGradient(colors: [
                          AppColors.lightYellow,
                          AppColors.darkYellow
                        ])),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          w * 0.09, h * 0.03, w * 0.08, h * 0.03),
                      child: SizedBox(
                        width: w / 2.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.startTask,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: w * 0.08,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: CircleAvatar(
                                backgroundColor: Colors.white70,
                                radius: w * 0.085,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(w * 0.4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0, height: h * 0.11, child: bottomNavigationTwo(context)),
        ],
      ),
    );
  }
}
