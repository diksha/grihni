import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AchaarPrepared extends ConsumerWidget {
  final Task task;
  const AchaarPrepared({Key? key, required this.task}) : super(key: key);

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
            right: -w * 0.23,
            left: -w * 0.23,
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
            bottom: h*0.05,
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
                      height: h * 0.25,
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
                Positioned(
                  bottom: h*0.05,
                  child: MaterialButton(
                    onPressed: () {},
                    child: Ink(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(w * 0.4)),
                          gradient: LinearGradient(colors: [
                            AppColors.lightYellow,
                            AppColors.darkYellow
                          ])),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            w * 0.09, h * 0.019, w * 0.08, h * 0.019),
                        child: SizedBox(
                          width: w / 2.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Start\nTask ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: w * 0.07,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  backgroundColor: Colors.white70,
                                  radius: w * 0.085,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(w * 0.4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
