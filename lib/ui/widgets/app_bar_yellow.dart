import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/ui/shares/app_colors.dart';

Widget appBarYellow(context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, languageSelectScreenRoute);
          },
          child: SizedBox(
            height: 30,
            child: Image.asset('assets/images/icons/back_yellow.png'),
          ),
        ),
        //Buttons Should be replaced here
        Row(
          children: [
            TextButton(
              child: Text("English",style: TextStyle(color: AppColors.darkYellow),),
              onPressed: null,
            ),
            Text("|",style: TextStyle(color: AppColors.darkYellow),),
            TextButton(
              child: Text("Nepali",style: TextStyle(color: AppColors.darkYellow),),
              onPressed: null,
            ),
          ],
        ),
      ],
    ),
  );
}
