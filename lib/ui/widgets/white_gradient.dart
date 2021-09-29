import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junkiri/ui/shares/app_colors.dart';

whiteGradient(){
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.btnLightYellow,
        Colors.white,
      ],
    ),
  );
}