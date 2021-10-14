import 'package:flutter_riverpod/all.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/services/firestore_service.dart';

final taskProvider = FutureProvider.family<List<Task>,List<String>>((ref,listOfTaskIds) async {
  FirestoreService _firestoreService = FirestoreService();
  List<Task> taskList = await _firestoreService.getTaskList(listOfTaskIds);
  return taskList;
});

final newTaskProvider = FutureProvider<List<Task>>((ref) async {
  FirestoreService _firestoreService = FirestoreService();
  List<Task> taskList = await _firestoreService.getListofNewTasks();
  return taskList;
});