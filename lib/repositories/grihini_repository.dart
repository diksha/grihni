import 'package:flutter_riverpod/all.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/shares/app_constants.dart';

final grihiniProvider = FutureProvider<Grihini>((ref) async {
  FirestoreService _firestoreService = FirestoreService();
  Grihini grihini = await _firestoreService.getGrihini(currentUser);
  grihini.currentTask =
      await _firestoreService.getTask(grihini.pendingTasks[0]);
  return grihini;
});
