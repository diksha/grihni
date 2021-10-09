import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget bottomNavigationTwo(BuildContext context){
  return Container(
    width: w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            SizedBox(
              child:
              Image.asset('assets/images/icons/home.png'),
              width: w * 0.07,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.home,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: w * 0.06),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              child:
              Image.asset('assets/images/icons/task.png'),
              width: w * 0.05,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.task,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: w * 0.06),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}