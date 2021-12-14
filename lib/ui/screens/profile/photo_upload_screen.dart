//Caution: Only works on Android & iOS platforms
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:path/path.dart';

final Color yellow = AppColors.lightYellow;
final Color orange = AppColors.darkYellow;

class UploadPhoto extends StatefulWidget {
  final String uploadLink;
  final bool isProfilePicture;
  final Grihini grihini;
  const UploadPhoto(
      {Key? key,
      required this.uploadLink,
      required this.isProfilePicture,
      required this.grihini})
      : super(key: key);
  @override
  _UploadPhotoState createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  FirestoreService fireService = FirestoreService();
  bool isPhotoTaken=false;
  final picker = ImagePicker();
  bool loading = false;
  File? _imageFile;
  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    //String fileName = basename(_imageFile!.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(widget.uploadLink);
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile!);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {

    });
    taskSnapshot.ref.getDownloadURL().then(
          (value) {
        widget.isProfilePicture
            ? fireService.grihiniRef
            .doc(widget.grihini.uid)
            .update({"profilePicture": value})
            : null;
      },
    );
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                gradient: LinearGradient(
                    colors: [orange, yellow],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Select the image",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: _imageFile != null
                              ? Image.file(_imageFile!)
                              : FlatButton(
                                  child: const Icon(
                                    Icons.add_a_photo,
                                    size: 50,
                                  ),
                                  onPressed: (){
                                    pickImage();
                                    setState(() {
                                      isPhotoTaken = true;
                                    });
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                loading
                    ? const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: CircularProgressIndicator(),
                      )
                    : isPhotoTaken?uploadImageButton(context):Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget uploadImageButton(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
            margin: const EdgeInsets.only(
                top: 30, left: 20.0, right: 20.0, bottom: 20.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [yellow, orange],
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  loading = true;
                });
                uploadImageToFirebase(context);
              },
              child: Text(
                "Upload Image",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
