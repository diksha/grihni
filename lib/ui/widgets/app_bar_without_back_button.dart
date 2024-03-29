import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/ui/shares/router_names.dart';
import 'package:junkiri/services/locale_provider.dart';
import 'package:junkiri/ui/shares/app_constants.dart';

Widget appBarWithoutBackButton(
    BuildContext context, ScopedReader watch, Grihini grihini) {
  final locale = watch(localeProvider);
  print('diksha' + grihini.toString());
  return Padding(
    padding: EdgeInsets.fromLTRB(20, h * 0.03, 20, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        grihini.email == "Admin"
            ? TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, adminScreenRoute);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Admin",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              )
            : Container(),
        //Buttons Should be replaced here
        Row(
          children: [
            TextButton(
              child: Text(
                "English",
                style: TextStyle(color: Colors.white, fontSize: w * 0.04),
              ),
              onPressed: () {
                locale.setEnglish();
              },
            ),
            Text(
              "|",
              style: TextStyle(color: Colors.white, fontSize: w * 0.04),
            ),
            TextButton(
              child: Text(
                "नेपाली",
                style: TextStyle(color: Colors.white, fontSize: w * 0.04),
              ),
              onPressed: () {
                locale.setNepali();
              },
            ),
          ],
        ),
      ],
    ),
  );
}
