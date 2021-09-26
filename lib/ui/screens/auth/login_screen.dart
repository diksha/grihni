import 'package:flutter/material.dart';
import 'package:junkiri/services/auth_service.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  AuthService authService = AuthService();
  FirestoreService fireService = FirestoreService();
  String verificationIdFinal = "";
  String smsCode = "";
  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              color: const Color(0xFFF2F2F4),
            ),
            Positioned(
              top: 0,
              left: -75,
              right: -75,
              child: Column(
                children: [
                  Image.asset('assets/images/background002.png'),
                  MaterialButton(
                    color: Colors.amber,
                    shape: const StadiumBorder(),
                    onPressed: () {
                      smsCode = otpController.text;
                      authService.loginWithPhoneNumber(
                          verificationIdFinal, smsCode, context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              child: Container(
                color: Colors.transparent,
                width: width,
                child: appBar(context),
              ),
            ),
            Positioned(
              top: 100,
              left: 100,
              right: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 75.0,
                    child: ClipRRect(
                      child: const Text("Login Logo"),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.white,
                            child: TextField(
                              controller: phoneNumberController,
                              decoration: const InputDecoration(hintText: "   Phone Number"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.white,
                            child: const TextField(decoration: InputDecoration(hintText: "   Email"),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () async {
                              await authService.verifyPhoneNumber(
                                  phoneNumberController.text, context, setData);
                            },
                            child: const Text(
                              "Click here for OTP",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.white,
                            child: TextField(
                              controller: otpController,
                              decoration: const InputDecoration(hintText: "   OTP"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
