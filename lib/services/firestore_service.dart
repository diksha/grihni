import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:junkiri/models/Achaar.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/models/step.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/ui/shares/app_constants.dart';

class FirestoreService {
  final grihiniRef =
      FirebaseFirestore.instance.collection('grihinies').withConverter<Grihini>(
            fromFirestore: (snapshot, _) => Grihini.fromMap(snapshot.data()!),
            toFirestore: (grihini, _) => grihini.toMap(),
          );
  final taskRef =
      FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
            fromFirestore: (snapshot, _) => Task.fromMap(snapshot.data()!),
            toFirestore: (task, _) => task.toMap(),
          );

  final achaarRef =
      FirebaseFirestore.instance.collection('achaarType').withConverter<Achaar>(
            fromFirestore: (snapshot, _) => Achaar.fromMap(snapshot.data()!),
            toFirestore: (achaar, _) => achaar.toMap(),
          );

  Future<void> addGrihini(name, phoneNumber, address, status, uid, pendingTasks,
      completedTasks, profilePicture, email) async {
    await grihiniRef.doc(uid).set(
          Grihini(
            address: address,
            phoneNumber: phoneNumber,
            name: name,
            status: status,
            uid: uid,
            pendingTasks: pendingTasks,
            completedTasks: completedTasks,
            profilePicture: profilePicture,
            email: email,
          ),
        );
  }

  Future<Grihini> getGrihini(uid) async {
    Grihini currentGrihini =
        await grihiniRef.doc(uid).get().then((snapshot) => snapshot.data()!);
    return currentGrihini;
  }

  Future<List<Task>> getTaskList(listOfTaskIds) async {
    List<Task> taskList = [];
    for (String docId in listOfTaskIds) {
      Task task = await taskRef.doc(docId).get().then((value) => value.data()!);
      taskList.add(task);
    }
    return taskList;
  }

  Future<List<Task>> getListofNewTasks() async {
    List<Task> newTaskList = [];
    QuerySnapshot value =
        await taskRef.where('orderStatus', isEqualTo: "CREATED").get();
    for (var result in value.docs) {
      Task task =
          await taskRef.doc(result.id).get().then((value) => value.data()!);
      newTaskList.add(task);
    }
    return newTaskList;
  }

  Future<List<Task>> getListofPendingTasks() async {
    List<Task> pendingTaskList = [];
    var taskIds = await grihiniRef
        .doc(currentUser)
        .get()
        .then((snapshot) => snapshot.data()!.pendingTasks);
    for (var taskId in taskIds) {
      Task task =
          await taskRef.doc(taskId).get().then((value) => value.data()!);
      pendingTaskList.add(task);
    }
    return pendingTaskList;
  }

  Future<List<Task>> getListofCompletedTasks() async {
    List<Task> completedTaskList = [];
    var taskIds = await grihiniRef
        .doc(currentUser)
        .get()
        .then((snapshot) => snapshot.data()!.completedTasks);
    for (var taskId in taskIds) {
      Task task =
          await taskRef.doc(taskId).get().then((value) => value.data()!);
      completedTaskList.add(task);
    }
    return completedTaskList;
  }

  Future<void> acceptTask(Grihini grihini, Task task) async {
    List<String> pendingTasks = grihini.pendingTasks;
    if (!pendingTasks.contains(task.docId)) {
      pendingTasks.add(task.docId);
    }
    grihiniRef.doc(grihini.uid).update({"pendingTasks": pendingTasks});
    taskRef.doc(task.docId).update({"pickedBy": grihini.uid});
    taskRef.doc(task.docId).update({"orderStatus": "GROCERY_PENDING"});
  }

  Future<void> startTask(Task task) async {
    taskRef.doc(task.docId).update({"orderStatus": "PREPARING"});
  }

  Future<void> completedTheStep(Task task) async {
    int currentStep = task.currentStep + 1;
    return taskRef.doc(task.docId).update({"currentStep": currentStep});
  }

  Future<void> achaarPrepared(Task task) async {
    taskRef.doc(task.docId).update({"orderStatus": "READY_FOR_PICKUP"});
  }

  Future<void> completedTask(Grihini grihini, Task task) async {
    taskRef.doc(task.docId).update({"orderStatus": "ORDER_COMPLETED"});
    List<String> pendingTasks = grihini.pendingTasks;
    pendingTasks.remove(task.docId);
    grihiniRef.doc(grihini.uid).update({"pendingTasks": pendingTasks});
    List<String> completedTasks = grihini.completedTasks;
    if (!completedTasks.contains(task.docId)) {
      completedTasks.add(task.docId);
    }
    grihiniRef.doc(grihini.uid).update({"completedTasks": completedTasks});
  }

  Future<Achaar> getAchaar(String achaarType) async {
    Achaar achaar =
        await achaarRef.doc(achaarType).get().then((value) => value.data()!);
    return achaar;
  }

  Future<Task> getTask(String docId) async {
    Task currentTask =
        await taskRef.doc(docId).get().then((snapshot) => snapshot.data()!);
    return currentTask;
  }
}
