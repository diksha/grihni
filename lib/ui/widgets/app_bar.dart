import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBar(context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 30,
          child: Image.asset('assets/images/icons/back.png'),
        ),
        //Buttons Should be replaced here
        const Text("English | Nepali",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ],
    ),
  );
}
