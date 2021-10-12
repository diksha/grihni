import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/ui/shares/app_constants.dart';

Widget appBar(context) {
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
              onPressed: null,
            ),
            Text("|",style: TextStyle(color: Colors.white,fontSize: w*0.04),),
            TextButton(
              child: Text("Nepali",style: TextStyle(color: Colors.white,fontSize: w*0.04),),
              onPressed: null,
            ),
          ],
        ),
      ],
    ),
  );
}
