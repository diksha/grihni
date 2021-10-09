import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';

class AchaarPrepared extends ConsumerWidget {
  const AchaarPrepared({Key? key}) : super(key: key);

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
          Positioned(
            top: 0,
            right: -w * 0.2,
            left: -w * 0.2,
            child: Container(
              child: Image.asset("assets/images/background005.png"),
            ),
          ),
          Container(
            height: h * 0.18,
            child: appBar(context,watch),
          ),
          Positioned(
            width: w,
            top: h * 0.18,
            bottom: h * 0.11,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(w * 0.01),
                  child: Text(
                    "WOHOOO!",
                    style: TextStyle(
                        fontSize: w * 0.08, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      child: Image.asset("assets/images/prepared.png"),
                      height: h * 0.32,
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.all(w*0.02),
                      child: Text(
                        "Your Achaar has been SUCCESSFULLY prepared. Thank you!",
                        style: TextStyle(
                            fontSize: w * 0.06, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
