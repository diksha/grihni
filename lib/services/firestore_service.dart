import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirestoreService {
  final grihiniRef =
  FirebaseFirestore.instance.collection('grihinies').withConverter<Grihini>(
    fromFirestore: (snapshot, _) => Grihini.fromMap(snapshot.data()!),
    toFirestore: (grihini, _) => grihini.toMap(),
  );

  Future<void> addGrihini(name,phoneNumber,address,status,uid) async {
    await grihiniRef.doc(uid).set(
      Grihini(address: address, phoneNumber: phoneNumber, name: name, status:status,),
    );

  }

  Future<Grihini> getGrihini(uid) async {

    Grihini currentGrihini = await grihiniRef.doc(uid).get().then((snapshot) => snapshot.data()!);

    return currentGrihini;
  }

}