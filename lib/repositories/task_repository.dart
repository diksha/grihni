import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/services/firestore_service.dart';

final tasksProvider = FutureProvider.autoDispose
    .family<List<Task>, List<String>>((ref, listOfTaskIds) async {
  FirestoreService _firestoreService = FirestoreService();
  List<Task> taskList = await _firestoreService.getTaskList(listOfTaskIds);
  return taskList;
});

final newTaskProvider = FutureProvider.autoDispose<List<Task>>((ref) async {
  FirestoreService _firestoreService = FirestoreService();
  List<Task> taskList = await _firestoreService.getListofNewTasks();
  return taskList;
});

class TaskNotifier extends ChangeNotifier {
  final ProviderReference ref;

  TaskNotifier(this.ref);
  Task? _task;

  Task? get task => _task;


  void setTaskId(String taskId) {
    FirestoreService _firestoreService = FirestoreService();
    _firestoreService.getTask(taskId).then((value) {
      _task = value;
      notifyListeners();
    });
  }

  void incrementSteps(Task task) {

    FirestoreService _firestoreService = FirestoreService();
    _firestoreService.completedTheStep(task).then((value) =>
        _firestoreService.getTask(task.docId).then((value) {
          _task = value;
          notifyListeners();
        }
        ));
  }
}


final currentTaskProvider =
ChangeNotifierProvider<TaskNotifier>((ref) => TaskNotifier(ref));

