import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  Future<String> uploadPhoto(XFile file,task) async {
    String filename = file.path;
    Reference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('tasks/${task.taskId}/$filename');
    UploadTask uploadTask = firebaseStorageRef.putFile(File(filename));
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
    return taskSnapshot.ref.getDownloadURL();
  }
}
