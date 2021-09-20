import 'package:flutter/material.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/services/firestore_service.dart';
import '../locate.dart';
import 'busy_model.dart';

class SignupViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  Future addGrihini(context,{required String name,required String phoneNumber,required String address}) async {
    try{
      await _firestoreService
          .addGrihini(Grihini(name: name,phoneNumber: phoneNumber,address: address)).then((value) =>
      {
      Navigator.pop(context),
      Navigator.pushNamed(context, loginScreenRoute),
      });

    }
    catch(e){
      return e.toString();
    }




}}