import 'package:flutter_riverpod/all.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/services/firestore_service.dart';

final taskProvider = FutureProvider<Task>((ref) async {
  FirestoreService _firestoreService = FirestoreService();
  Task task = await _firestoreService.getTask("121A");
  return task;
});