import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  Future<String> uploadProfilePicture(File file,task) async {
    String filename = file.path;
    Reference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('tasks/${task.taskId}/$filename');
    UploadTask uploadTask = firebaseStorageRef.putFile(File(filename));
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
    return taskSnapshot.ref.getDownloadURL();
  }
}
