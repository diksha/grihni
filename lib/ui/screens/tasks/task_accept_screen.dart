import 'package:flutter/material.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:junkiri/ui/shares/router_names.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/widgets/app_bar_yellow.dart';
import 'package:junkiri/ui/widgets/bottom_navigation_two.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';

class TaskAccept extends ConsumerWidget {
  final Task task;
  final Grihini grihini;
  const TaskAccept({Key? key, required this.task, required this.grihini})
      : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    FirestoreService fireService = FirestoreService();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: h,
            decoration: whiteGradient(),
          ),
          Positioned(
            top: 0,
            width: w,
            child: Container(
              height: h * 0.18,
              child: appBarYellow(context, watch),
            ),
          ),
          Positioned(
            top: h * 0.18,
            child: Container(
              height: h * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        child: Image.asset("assets/images/job.png"),
                        height: h * 0.1,
                      ),
                      Text(
                        AppLocalizations.of(context)!.job(task.jobId),
                        style: TextStyle(
                            fontSize: w * 0.06, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .achaarAndAmount(task.achaarType, task.amount),
                    style: TextStyle(fontSize: w * 0.09),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            height: h * 0.3,
            child: Container(
              width: w,
              decoration: yellowGradient(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    width: w / 1.6,
                    top: -h * 0.0435,
                    child: MaterialButton(
                      shape: StadiumBorder(),
                      color: const Color(0xFF97C85C),
                      onPressed: () async {
                        await fireService
                            .acceptTask(grihini, task)
                            .whenComplete(() => Navigator.pushReplacementNamed(
                                context, groceryPendingScreenRoute,
                                arguments: [task, grihini]));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(w * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child:
                                  Image.asset('assets/images/icons/accept.png'),
                              height: h * 0.03,
                            ),
                            Text(
                              " ${AppLocalizations.of(context)!.accept}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: w * 0.06),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: h * 0.08,
                    width: w / 1.6,
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      color: const Color(0xFFEF4F44),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, taskDetailsScreenRoute);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(w * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Image.asset(
                                  'assets/images/icons/decline.png'),
                              height: h * 0.03,
                            ),
                            Text(
                              " ${AppLocalizations.of(context)!.decline}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: w * 0.06),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: h * 0.03, child: bottomNavigationTwo(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
