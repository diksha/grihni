import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
              bottom: 0,
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
                height: height / 2,
                width: width,
                child: _signupForm(context),
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

Widget _signupForm(context) {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  return Padding(
    padding: const EdgeInsets.all(60.0),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
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
                  SizedBox(
                    height: 10,
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
                    maxLength: 10,
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp(r"\d"))
                    ],
                  ),
                  SizedBox(
                    height: 10,
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
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -30,
          child: MaterialButton(
            minWidth: 150,
            height: 50,
            onPressed: () {
              Navigator.pushReplacementNamed(context, trainingScreenRoute);
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

