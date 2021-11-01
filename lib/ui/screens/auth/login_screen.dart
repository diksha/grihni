import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:junkiri/services/auth_service.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    String otpBtnLabel = AppLocalizations.of(context)!.clickHereForOTP;
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            color: const Color(0xFFF2F2F4),
          ),
          Positioned(
            top: 0,
            left: -w * 0.16,
            right: -w * 0.16,
            child: Image.asset('assets/images/background001.png'),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.login,
                      style: TextStyle(
                        fontSize: h * 0.05,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    CircleAvatar(
                      radius: w * 0.15,
                      child: ClipRRect(
                        child: SvgPicture.asset('assets/images/svg/person.svg'),
                        borderRadius: BorderRadius.circular(w * 0.5),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(w * 0.15, 0, w * 0.15, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(w * 0.01))),
                        child: TextField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                              hintText:
                                  "   ${AppLocalizations.of(context)!.phoneNumber}"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(w * 0.15, 0, w * 0.15, 0),
                      child: TextButton(
                        onPressed: () async {
                          await authService.verifyPhoneNumber(
                              phoneNumberController.text, context, setData);
                        },
                        child: Text(
                          otpBtnLabel,
                          style: TextStyle(
                            fontSize: w * 0.05,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(w * 0.15, 0, w * 0.15, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(w * 0.01))),
                        child: TextField(
                          controller: otpController,
                          decoration: const InputDecoration(
                              hintText: "   OTP", prefixText: "  "),
                        ),
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () {
                    smsCode = otpController.text;
                    authService.loginWithPhoneNumber(
                        verificationIdFinal, smsCode, context);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(w * 0.5)),
                        gradient: LinearGradient(colors: [
                          AppColors.lightYellow,
                          AppColors.darkYellow
                        ])),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          w * 0.1, h * 0.02, w * 0.1, h * 0.02),
                      child: Text(
                        AppLocalizations.of(context)!.login,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.needHelp,
                      style: TextStyle(color: Colors.black, fontSize: w * 0.04),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
