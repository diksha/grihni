import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/services/firestore_service.dart';

import '../locate.dart';
import 'busy_model.dart';

class SignupViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();


  Future addGrihini({required String name,required String phoneNumber,required String address}) async {
    setBusy(true);

    await _firestoreService
          .addGrihini(Grihini(name: name,phoneNumber: phoneNumber,address: address));

    setBusy(false);

}}