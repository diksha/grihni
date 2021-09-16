import 'package:flutter/cupertino.dart';
import 'package:junkiri/constants/app_colors.dart';

yellowGradient(){
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.lightYellow,
        AppColors.darkYellow,
      ],
    ),
  );
}