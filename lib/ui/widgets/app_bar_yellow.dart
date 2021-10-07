import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/app_constants.dart';

Widget appBarYellow(context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(w*0.04, 0, w*0.04, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: SizedBox(
            height: w*0.08,
            child: Image.asset('assets/images/icons/back_yellow.png'),
          ),
        ),
        //Buttons Should be replaced here
        Row(
          children: [
            TextButton(
              child: Text("English",style: TextStyle(color: AppColors.darkYellow,fontSize: w*0.05),),
              onPressed: null,
            ),
            Text("|",style: TextStyle(color: AppColors.darkYellow),),
            TextButton(
              child: Text("Nepali",style: TextStyle(color: AppColors.darkYellow,fontSize: w*0.05),),
              onPressed: null,
            ),
          ],
        ),
      ],
    ),
  );
}
