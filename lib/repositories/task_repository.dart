import 'package:flutter_riverpod/all.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/services/firestore_service.dart';


final taskProvider = FutureProvider.family<List<Task>,List<String>>((ref,completedTasks) async {
  FirestoreService _firestoreService = FirestoreService();
  List<Task> completedTaskList = await _firestoreService.getTaskList(completedTasks);
  return completedTaskList;

});