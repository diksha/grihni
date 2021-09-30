import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> addGrihini(name,phoneNumber,address,status,uid) async {
    await grihiniRef.doc(uid).set(
      Grihini(address: address, phoneNumber: phoneNumber, name: name, status:status, uid: uid, pendingTasks: ["131A","121S"], completedTasks: ["141A","122S"],),
    );

  }

  Future<Grihini> getGrihini(uid) async {
    Grihini currentGrihini = await grihiniRef.doc(uid).get().then((snapshot) => snapshot.data()!);
    return currentGrihini;
  }

  Future<Task> getTask(jobId) async {
      Task task = await taskRef.where('jobId', isEqualTo: "$jobId").get().then((value) => value.docs[0].data());
      print(task);
      return task;
  }
/*
  Future<Task> getPendingTasks() async {
      return
  }
    Future<Task> getNewTasksLimited() async {
    FirebaseFirestore.instance.collection('Tasks')
  .where('jobStatus', isEqualTo: "CREATED")
  .orderBy('Timestamp')
  .limitToLast(3)
  .get()
  .then(...);
      return
  }

  Future<Task> getPendingTasksLimited() async {
  FirebaseFirestore.instance.collection('Tasks')
  .where('jobStatus', isEqualTo: "CREATED")
  .orderBy('Timestamp')
  .limitToLast(3)
  .get()
  .then(...);
      return
  }
*/


}