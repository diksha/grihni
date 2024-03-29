import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar_without_back_button.dart';
import 'package:junkiri/ui/widgets/app_bar_yellow.dart';
import 'package:junkiri/ui/widgets/bottom_navigation_two.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroceryPending extends ConsumerWidget {
  final Task task;
  final Grihini grihini;
  const GroceryPending({Key? key, required this.task, required this.grihini})
      : super(key: key);

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
          Container(
            height: h * 0.18,
            child: appBarWithoutBackButton(context, watch, grihini),
          ),
          Positioned(
            width: w,
            top: h * 0.18,
            bottom: h * 0.11,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset("assets/images/job.png"),
                  height: h * 0.15,
                ),
                Text(
                  AppLocalizations.of(context)!.letsBegin(task.jobId),
                  style: TextStyle(fontSize: w * 0.06),
                ),
                SizedBox(
                  child: Image.asset("assets/images/grocery_pending.png"),
                  height: h * 0.2,
                ),
                Padding(
                  padding: EdgeInsets.all(w * 0.08),
                  child: Text(
                    AppLocalizations.of(context)!.purchaceManagerWillContactYou,
                    style: TextStyle(
                      fontSize: w * 0.05,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              height: h * 0.11,
              child: bottomNavigationHome(context)),
        ],
      ),
    );
  }
}
