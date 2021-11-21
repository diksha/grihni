import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junkiri/ui/shares/router_names.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';

Widget bottomNavigationTwo(BuildContext context){
  return Container(
    width: w,
    decoration: yellowGradient(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            SizedBox(
              child: Image.asset('assets/images/icons/home.png'),
              width: w * 0.07,
            ),
            TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context,homeScreenRoute);
              },
              child: Text(
                AppLocalizations.of(context)!.home,
                style: TextStyle(
                    color: Colors.black54, fontSize: w * 0.06),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              child: Image.asset('assets/images/icons/task.png'),
              width: w * 0.05,
            ),
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => false);
                Navigator.popAndPushNamed(context,taskDetailsScreenRoute,arguments: "PENDING_TASKS");
              },
              child: Text(
                AppLocalizations.of(context)!.task,
                style: TextStyle(
                    color: Colors.black54, fontSize: w * 0.06),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}