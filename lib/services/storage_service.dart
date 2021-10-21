import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';

class StorageService {
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  final grihiniRef =
  FirebaseFirestore.instance.collection('grihinies').withConverter<Grihini>(
    fromFirestore: (snapshot, _) => Grihini.fromMap(snapshot.data()!),
    toFirestore: (grihini, _) => grihini.toMap(),
  );

  Future<void> uploadExample() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.absolute}/file-to-upload.png';
  }

}