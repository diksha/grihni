//Caution: Only works on Android & iOS platforms
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/widgets/app_bar_without_back_button.dart';
import 'package:path/path.dart';

import '../../widgets/app_bar.dart';

final Color yellow = AppColors.lightYellow;
final Color orange = AppColors.darkYellow;

class UploadPhoto extends StatefulWidget {
  final String uploadLink;
  const UploadPhoto({Key? key, required this.uploadLink}) : super(key: key);
  @override
  _UploadPhotoState createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  final picker = ImagePicker();
  File? _imageFile;
  bool _loading = false;
  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    setState(() {
      _loading = true;
    });
    String fileName = basename(_imageFile!.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('${widget.uploadLink}/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile!);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    taskSnapshot.ref.getDownloadURL().then(
          (value) => print("Done: $value"),
        );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
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
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Consumer(
                        builder:
                            (BuildContext context, ScopedReader watch, child) {
                          return Container(
                            color: Colors.transparent,
                            width: w,
                            child: appBarWithoutBackButton(context, watch),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      _imageFile != null
                          ? 'Photo selected'
                          : "Click on icon below to take a photo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
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
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: 50,
                                  ),
                                  onPressed: pickImage,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                _imageFile != null ? uploadImageButton(context) : Container(),
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
              onPressed: () => uploadImageToFirebase(context),
              child: _loading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    )
                  : Text(
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
