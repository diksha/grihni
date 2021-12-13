import 'package:flutter_riverpod/all.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/shares/app_constants.dart';

final grihiniProvider = FutureProvider<Grihini>((ref) async {
  FirestoreService _firestoreService = FirestoreService();
  Grihini grihini = await _firestoreService.getGrihini(currentUser);
  return grihini;
});

final trainingGrihiniProvider = FutureProvider<List<Grihini>>((ref) async {
  FirestoreService _firestoreService = FirestoreService();
  List<Grihini> trainingGrihinies = await _firestoreService.getTrainingGrihinies();
  return trainingGrihinies;
});
