import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:junkiri/models/grihini.dart';

class FirestoreService{
  final CollectionReference _postsCollectionReference =
  FirebaseFirestore.instance.collection('grihinis');

  Future addGrihini(Grihini grihini) async {
    try {
      await _postsCollectionReference.doc(grihini.phoneNumber).set(grihini.toMap());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

}