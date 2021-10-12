import 'package:flutter/material.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';
import 'package:junkiri/ui/widgets/bottom_navigation_two.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';

class ProfileSettings extends StatelessWidget {
  final Grihini grihini;
  const ProfileSettings({Key? key, required this.grihini}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                appBar(context),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.08),
                  child: Text(
                    "Profile Settings",
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
            top: h*0.2,
            width: w,
            bottom: h*0.11,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(w*0.05),
                        child: SizedBox(
                          child: Image.asset('assets/images/person.png'),
                          width: w*0.25,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(grihini.name),
                          Text(grihini.address),
                          Text(grihini.phoneNumber),
                          MaterialButton(onPressed: (){}, child: Text("Edit"),)
                        ],
                      ),
                    ],
                  ),
                ),
                _button(),
                _button(),
                _button(),
                _button(),
                _button(),

              ],
            ),
          ),
          Positioned(
            bottom: 0,
            height: h * 0.11,
            child: Container(
              width: w,
              decoration: yellowGradient(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        child: Image.asset('assets/images/icons/home.png'),
                        width: w*0.07,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.black54, fontSize: w * 0.06),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Image.asset('assets/images/icons/task.png'),
                        width: w*0.05,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          " Task",
                          style: TextStyle(
                              color: Colors.black54, fontSize: w * 0.06),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
Widget _button(){
  return MaterialButton(
    onPressed: () {
    },
    child: Ink(
      width: w*0.7,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
              colors: [AppColors.lightYellow, AppColors.darkYellow])),
      child: Padding(
        padding: EdgeInsets.all(w*0.03),
        child: Text(
          "Upload Profile Picture",
          textAlign: TextAlign.center,style: TextStyle(fontSize: w*0.04,color: Colors.white),
        ),
      ),
    ),
  );
}