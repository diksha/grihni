import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/screens/profile/home_screen.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {
  FirestoreService _firestoreService = FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context, Function setData) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, "Verification Completed");
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      showSnackBar(context, exception.toString());
    };
    PhoneCodeSent codeSent =
        (String verificationID, int? forceResnedingtoken) {
      showSnackBar(context, "Verification Code sent on the phone number");
      setData(verificationID);
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      showSnackBar(context, "Time out");
    };
    try {
      await _auth.verifyPhoneNumber(
          timeout: Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  Future<void> signOut({required BuildContext context}) async {
    try {
      await _auth.signOut();
    } catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> signupWithPhoneNumber(
      String verificationId, String smsCode, BuildContext context,Grihini grihini) async {
    try {
      AuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      _auth
          .signInWithCredential(authCredential)
          .then((UserCredential result) async {
        _firestoreService.addGrihini(grihini.name, result.user!.phoneNumber,grihini.address,grihini.status, result.user!.uid,);
        SharedPreferences.getInstance().then((value) {
          value.setBool('isFirstTime', false);
          value.setString('currentUid',result.user!.uid );
        });
        currentUser =result.user!.uid;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (builder) => HomeScreen()),
                (route) => false);
        print('Signup completed.');
      }).catchError((e) {
        print(e);
      });



    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> loginWithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      _auth
          .signInWithCredential(authCredential)
          .then((UserCredential result) async{
           SharedPreferences.getInstance().then((value) {
             value.setBool('isFirstTime', false);
             value.setString('currentUid',result.user!.uid );
           });
           currentUser =result.user!.uid;
           Navigator.pop(context);
           Navigator.pushAndRemoveUntil(
               context,
               MaterialPageRoute(builder: (builder) => HomeScreen()),
                   (route) => false);
        print('Login completed.');
      }).catchError((e) {
        print(e);
      });


    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}