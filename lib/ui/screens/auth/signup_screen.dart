import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_svg/svg.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/services/auth_service.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: yellowGradient(),
          ),
          Positioned(
            top: h / 2,
            child: Container(
              color: AppColors.offWhite,
              height: h / 2,
              width: w,
            ),
          ),
          Positioned(
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                height: h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Consumer(
                      builder: (BuildContext context, ScopedReader watch, child) {
                        return Container(
                          color: Colors.transparent,
                          width: w,
                          child: appBar(context, watch),
                        );
                      },
                    ),
                    Container(
                      color: Colors.transparent,
                      width: w,
                      child: _header(context),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: w,
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
                    MaterialButton(
                      onPressed: () {
                        smsCode = otpController.text;
                        authService.signupWithPhoneNumber(
                            verificationIdFinal,
                            smsCode,
                            context,
                            Grihini(
                                name: nameController.text,
                                phoneNumber: phoneNumberController.text,
                                address: addressController.text,
                                status: 'training_pending',
                                uid: '',
                                pendingTasks: [],
                                completedTasks: [],
                                profilePicture: "",
                              email: ""
                            ));
                      },
                      child: Ink(
                        decoration: yellowGradient(),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              w * 0.08, h * 0.01, w * 0.08, h * 0.01),
                          child: Text(
                            AppLocalizations.of(context)!.signup,
                            style:
                                TextStyle(color: Colors.white, fontSize: w * 0.055),
                          ),
                        ),
                      ),
                      elevation: 0,
                    ),
                    _footer(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _header(BuildContext context) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: Colors.white,
        radius: w * 0.15,
        child: ClipRRect(
          child: Padding(
            padding: EdgeInsets.all(w * 0.05),
            child: Image.asset('assets/images/logo.png'),
          ),
          borderRadius: BorderRadius.circular(w * 0.5),
        ),
      ),
      SizedBox(
        height: h * 0.01,
      ),
      Text(
        AppLocalizations.of(context)!.signupForm,
        style: TextStyle(
            fontSize: w * 0.08,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    ],
  );
}

Widget signupForm(
    context,
    nameController,
    phoneNumberController,
    addressController,
    otpController,
    authService,
    Function setData,
    smsCode,
    verificationIdFinal) {
  return Padding(
    padding: EdgeInsets.only(left: w * 0.15, right: w * 0.15),
    child: Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(w * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.name,
              style: TextStyle(
                  color: AppColors.darkYellow,
                  fontSize: w * 0.03,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: nameController,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp(r"[a-zA-Z]+|\s"))
              ],
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(w * 0.01),
              ),
            ),
            SizedBox(
              height: h * 0.015,
            ),
            Text(
              AppLocalizations.of(context)!.address,
              style: TextStyle(
                  color: AppColors.darkYellow,
                  fontSize: w * 0.03,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(w * 0.01),
              ),
              controller: addressController,
            ),
            SizedBox(
              height: h * 0.015,
            ),
            Text(
              AppLocalizations.of(context)!.phoneNumber,
              style: TextStyle(
                  color: AppColors.darkYellow,
                  fontSize: w * 0.03,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(w * 0.01),
              ),
            ),
            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () async {
                    await authService.verifyPhoneNumber(
                        phoneNumberController.text, context, setData);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.clickHereForOTPBtn,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.darkYellow,
                        fontSize: w * 0.03,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: w / 4,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey,
                      isDense: true,
                      contentPadding: EdgeInsets.all(w * 0.01),
                    ),
                    controller: otpController,
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp(r"\d"))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _footer(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(AppLocalizations.of(context)!.alreadyHaveAccount),
      SizedBox(
        width: w * 0.02,
      ),
      Text(
        AppLocalizations.of(context)!.login,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );
}
