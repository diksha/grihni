import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/services/auth_service.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  AuthService authService = AuthService();
  FirestoreService fireService = FirestoreService();
  String verificationIdFinal = "";
  String smsCode = "";
  String buttonName = "Send";
  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: yellowGradient(),
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
              top: 90,
              child: Container(
                color: Colors.transparent,
                width: width,
                child: _header(),
              ),
            ),
            Positioned(
              top: height / 2,
              child: Container(
                color: AppColors.offWhite,
                height: height / 2,
                width: width,
              ),
            ),
            Positioned(
              bottom: 75,
              child: _footer(),
            ),
            Positioned(
              bottom: height / 6,
              child: Container(
                color: Colors.transparent,
                height: height / 1.6,
                width: width,
                child: signupForm(
                    context,
                    nameController,
                    phoneNumberController,
                    addressController,
                    otpController,
                    authService,
                    setData,
                  smsCode,
                  verificationIdFinal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _header() {
  return Column(
    children: [
      CircleAvatar(
        radius: 55.0,
        child: ClipRRect(
          child: Image.asset('assets/images/logo.png'),
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Text(
        "Sign Up Form",
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ],
  );
}

Widget signupForm(context, nameController, phoneNumberController,
    addressController, otpController, authService, Function setData,smsCode,verificationIdFinal) {
  return Padding(
    padding: const EdgeInsets.all(60.0),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "NAME",
                  style: TextStyle(
                      color: AppColors.darkYellow,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: nameController,
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp(r"[a-zA-Z]+|\s"))
                  ],
                ),
                Text(
                  "PHONE NUMBER",
                  style: TextStyle(
                      color: AppColors.darkYellow,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: phoneNumberController,
                ),
                Text(
                  "OTP",
                  style: TextStyle(
                      color: AppColors.darkYellow,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: otpController,
                  maxLength: 10,
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp(r"\d"))
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    await authService.verifyPhoneNumber(
                        phoneNumberController.text, context, setData);
                  },
                  child: const Text("Send OTP"),
                ),
                Text(
                  "ADDRESS",
                  style: TextStyle(
                      color: AppColors.darkYellow,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: addressController,

                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -30,
          child: MaterialButton(
            minWidth: 150,
            height: 50,
            onPressed: () {
              smsCode = otpController.text;
              authService.signupWithPhoneNumber(
                  verificationIdFinal, smsCode, context,Grihini(name: nameController.text, phoneNumber: phoneNumberController.text, address: addressController.text, status: 'training_pending'));
            },
            child: Ink(
              decoration: yellowGradient(),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(
                  "SIGN UP",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            elevation: 0,
          ),
        ),
      ],
      overflow: Overflow.visible,
    ),
  );
}

Widget _footer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text("Already have account? "),
      Text(
        "Log in",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );
}
