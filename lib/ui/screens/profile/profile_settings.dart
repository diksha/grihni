import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/services/auth_service.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/shares/router_names.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';
import 'package:junkiri/ui/widgets/bottom_navigation_two.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileSettings extends ConsumerWidget {
  final Grihini grihini;
  const ProfileSettings({Key? key, required this.grihini}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h,
            decoration: whiteGradient(),
          ),
          Container(
            height: h * 0.2,
            decoration: yellowGradient(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                appBar(context, watch),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.08),
                  child: Text(
                    AppLocalizations.of(context)!.profileSettings,
                    style: TextStyle(
                        fontSize: w * 0.07,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: h * 0.2,
            width: w,
            bottom: h * 0.11,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(w * 0.05),
                        child: SizedBox(
                          child: grihini.profilePicture == ""
                              ? SvgPicture.asset('assets/images/svg/person.svg')
                              : Image.network(grihini.profilePicture),
                          width: w * 0.25,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: w * 0.03,
                                child: Image.asset(
                                    'assets/images/icons/nameIcon.png'),
                              ),
                              SizedBox(
                                width: w * 0.02,
                              ),
                              Text(grihini.name),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: w * 0.03,
                                child: Image.asset(
                                    'assets/images/icons/addressIcon.png'),
                              ),
                              SizedBox(
                                width: w * 0.02,
                              ),
                              Text(grihini.address),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: w * 0.03,
                                child: Image.asset(
                                    'assets/images/icons/callIcon.png'),
                              ),
                              SizedBox(
                                width: w * 0.02,
                              ),
                              Text(grihini.phoneNumber),
                            ],
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                SizedBox(
                                  width: w * 0.03,
                                  child: Image.asset(
                                      'assets/images/icons/edit.png'),
                                ),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                Text(AppLocalizations.of(context)!.edit),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                _buttonProfilePicture(context, grihini),
                _buttonCitizenshipProof(context, grihini),
                _buttonMailingAddress(context, grihini),
                _buttonOtherPhotoes(context, grihini),
                _signoutButton(context),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              height: h * 0.11,
              child: bottomNavigationHome(context)),
        ],
      ),
    );
  }
}

Widget _buttonProfilePicture(context, Grihini grihini) {
  return MaterialButton(
    onPressed: () {
      Navigator.pushNamed(context, photoUploadScreenRoute,
          arguments: ["users/${grihini.uid}/profilePicture", true, grihini]);
    },
    child: Ink(
      width: w * 0.7,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
              colors: [AppColors.lightYellow, AppColors.darkYellow])),
      child: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: Row(
          children: [
            SizedBox(
              child: Image.asset("assets/images/icons/photo.png"),
              width: w * 0.05,
            ),
            SizedBox(
              width: w * 0.015,
            ),
            Text(
              AppLocalizations.of(context)!.uploadProfilePhoto,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: w * 0.04, color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buttonCitizenshipProof(context, Grihini grihini) {
  return MaterialButton(
    onPressed: () {
      Navigator.pushNamed(context, photoUploadScreenRoute,
          arguments: ["users/${grihini.uid}/citizenshipProof", false, grihini]);
    },
    child: Ink(
      width: w * 0.7,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
              colors: [AppColors.lightYellow, AppColors.darkYellow])),
      child: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: Row(
          children: [
            SizedBox(
              child: Image.asset("assets/images/icons/photo.png"),
              width: w * 0.05,
            ),
            SizedBox(
              width: w * 0.015,
            ),
            Text(
              AppLocalizations.of(context)!.uploadCitizenshipProof,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: w * 0.04, color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buttonOtherPhotoes(context, Grihini grihini) {
  return MaterialButton(
    onPressed: () {
      Navigator.pushNamed(context, photoUploadScreenRoute,
          arguments: ["users/${grihini.uid}/otherPhoto", false, grihini]);
    },
    child: Ink(
      width: w * 0.7,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
              colors: [AppColors.lightYellow, AppColors.darkYellow])),
      child: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: Row(
          children: [
            SizedBox(
              child: Image.asset("assets/images/icons/photo.png"),
              width: w * 0.05,
            ),
            SizedBox(
              width: w * 0.015,
            ),
            Text(
              AppLocalizations.of(context)!.uploadOtherPhotos,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: w * 0.04, color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _signoutButton(context) {
  AuthService authService = AuthService();
  return MaterialButton(
    onPressed: () {
      authService.signOut(context: context);
    },
    child: Ink(
      width: w * 0.7,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
              colors: [AppColors.lightYellow, AppColors.darkYellow])),
      child: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: Text(
          AppLocalizations.of(context)!.signOut,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: w * 0.04, color: Colors.white),
        ),
      ),
    ),
  );
}

Widget _buttonMailingAddress(context, grihini) {
  return MaterialButton(
    onPressed: () {
      _displayTextInputDialog(context, grihini);
    },
    child: Ink(
      width: w * 0.7,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
              colors: [AppColors.lightYellow, AppColors.darkYellow])),
      child: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: Row(
          children: [
            SizedBox(
              child: Image.asset("assets/images/icons/location.png"),
              width: w * 0.05,
            ),
            SizedBox(
              width: w * 0.015,
            ),
            Text(
              AppLocalizations.of(context)!.mailingAddress,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: w * 0.04, color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}

Future<void> _displayTextInputDialog(
    BuildContext context, Grihini grihini) async {
  FirestoreService fireService = FirestoreService();
  final TextEditingController _textFieldController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Your Email Address'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: ""),
          ),
          actions: <Widget>[
            FlatButton(
              color: AppColors.darkYellow,
              textColor: Colors.white,
              onPressed: () {
                fireService.grihiniRef
                    .doc(grihini.uid)
                    .update({"email": _textFieldController.text});
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      });
}
