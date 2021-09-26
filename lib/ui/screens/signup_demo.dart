import 'dart:async';
import 'package:flutter/material.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/services/auth_service.dart';
import 'package:junkiri/services/firestore_service.dart';

class SignupDemo extends StatefulWidget {
  const SignupDemo({Key? key}) : super(key: key);

  @override
  _SignupDemoState createState() => _SignupDemoState();
}

class _SignupDemoState extends State<SignupDemo> {
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  int start = 30;
  bool wait = false;
  String buttonName = "Send";
  TextEditingController phoneController = TextEditingController();
  AuthService authClass = AuthService();
  FirestoreService fireClass = FirestoreService();
  String verificationIdFinal = "";
  String smsCode = "";

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }
  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: TextField(
                controller: _phoneNumber,
              ),
            ),
            Center(
              child: TextField(
                controller: _otpController,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await authClass.verifyPhoneNumber(_phoneNumber.text, context, setData);
              },
              child: Text("Send OTP"),
            ),

            ElevatedButton(
              onPressed: () {
                smsCode = _otpController.text;
              },
              child: Text("Signup"),
            ),
            ElevatedButton(
              onPressed: () {
                smsCode = _otpController.text;
                authClass.loginWithPhoneNumber(
                    verificationIdFinal, smsCode, context);
              },
              child: Text("Login"),
            ),
            ElevatedButton(
              onPressed: () async {
                Grihini test = await fireClass.getGrihini("nGjPMWOgh4h73uOZL65wZdRAVBG3");
                print(test.phoneNumber);
              },
              child: Text("Read Data"),
            ),
          ],
        ),
      ),
    );
  }
}

