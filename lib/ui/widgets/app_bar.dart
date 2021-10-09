import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/services/locale_provider.dart';
import 'package:junkiri/ui/shares/app_constants.dart';

Widget appBar(BuildContext context, ScopedReader watch) {
  final locale = watch(localeProvider);
  return Padding(
    padding: EdgeInsets.fromLTRB(20, h*0.03, 20, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: SizedBox(
            height: w*0.08,
            child: Image.asset('assets/images/icons/back.png'),
          ),
        ),
        //Buttons Should be replaced here
        Row(
          children: [
            TextButton(
              child: Text("English",style: TextStyle(color: Colors.white,fontSize: w*0.04),),
              onPressed: (){
                locale.setEnglish();
              },
            ),
            Text("|",style: TextStyle(color: Colors.white,fontSize: w*0.04),),
            TextButton(
              child: Text("Nepali",style: TextStyle(color: Colors.white,fontSize: w*0.04),),
              onPressed: (){
                locale.setNepali();
              },
            ),
          ],
        ),
      ],
    ),
  );
}
