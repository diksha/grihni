import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:junkiri/models/grihini.dart';
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

  Future<void> addGrihini(name,phoneNumber,address,status,uid,pendingTasks,completedTasks) async {
    await grihiniRef.doc(uid).set(
      Grihini(address: address, phoneNumber: phoneNumber, name: name, status:status, uid: uid, pendingTasks:pendingTasks, completedTasks: completedTasks,),

    );

  }


  Future<Grihini> getGrihini(uid) async {
    Grihini currentGrihini = await grihiniRef.doc(uid).get().then((snapshot) => snapshot.data()!);
    return currentGrihini;
  }


  Future<List<Task>> getTaskList(listOfTaskIds) async {
    List<Task> taskList=[];
    for (String docId in listOfTaskIds){
      Task task = await taskRef.doc(docId).get().then((value) => value.data()!);
      taskList.add(task);
    }
    return taskList;
  }

  Future<List<Task>> getListofNewTasks() async {
    List<Task> newTaskList=[];
    QuerySnapshot value = await taskRef
        .where('pickedBy', isEqualTo: "")
        .get();
    for (var result in value.docs){
      Task task = await taskRef.doc(result.id).get().then((value) => value.data()!);
      newTaskList.add(task);
    }
    return newTaskList;
  }

  Future<void> acceptTask(uid, docId) async {
    taskRef.doc(docId).update({"pickedBy":uid,"jobStatus":OrderStatus.GROCERY_DROP_OFF});
    Grihini grihini = await grihiniRef.doc(uid).get().then((value) => value.data()!);
    List<String> pendingTasks = grihini.pendingTasks;
    pendingTasks.add(docId);
    grihiniRef.doc(uid).update({"pendingTasks":pendingTasks});
  }

  Future<void> startTask(docId) async {
    taskRef.doc(docId).update({"jobStatus":OrderStatus.PREPARING});
  }

  Future<void> completedTask(uid, docId) async {
    taskRef.doc(docId).update({"pickedBy":uid,"jobStatus":OrderStatus.ORDER_COMPLETED});
    Grihini grihini = await grihiniRef.doc(uid).get().then((value) => value.data()!);
    List<String> completedTasks = grihini.completedTasks;
    completedTasks.add(docId);
    grihiniRef.doc(uid).update({"completedTasks":completedTasks});
  }
}