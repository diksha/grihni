import 'package:flutter/cupertino.dart';
import 'package:junkiri/ui/shares/app_colors.dart';

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