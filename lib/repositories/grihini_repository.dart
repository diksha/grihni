import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:image_picker/image_picker.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/services/storage_service.dart';
import 'package:junkiri/ui/shares/app_constants.dart';

final grihiniProvider = FutureProvider<Grihini>((ref) async {
  FirestoreService _firestoreService = FirestoreService();
  Grihini grihini = await _firestoreService.getGrihini(currentUser);
  return grihini;
});

class GrihniNotifier extends ChangeNotifier {
  final ProviderReference ref;

  GrihniNotifier(this.ref);

  void uploadProfilePicture(XFile file) {
    StorageService _storageService = StorageService();
    FirestoreService _firestoreService = FirestoreService();
    _storageService.uploadProfilePicture(file).then((value) =>
        _firestoreService.updateGrihni(currentUser, value)
    );
    notifyListeners();
  }
}

final grihiniChangeProvider =
ChangeNotifierProvider<GrihniNotifier>((ref) => GrihniNotifier(ref));