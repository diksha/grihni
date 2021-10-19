import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key, required this.grihini}) : super(key: key);
  final Grihini grihini;

  @override
  Widget build(BuildContext context,ScopedReader watch) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Stack(
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
              appBar(context,watch),
              Padding(
                padding: EdgeInsets.only(left: w * 0.08),
                child: Text(
                  AppLocalizations.of(context)!.home,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(w * 0.08),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: w * 0.15,
                      child: ClipRRect(
                        child: Image.asset('assets/images/profile_pic.png'),
                        borderRadius: BorderRadius.circular(w * 0.5),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Text(
                      grihini.name,
                      style: TextStyle(
                          fontSize: w * 0.06,color: Color(0xFF58595B)),

                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Text(
                      "${AppLocalizations.of(context)!.junkiriCode}: J00001",
                      style: TextStyle(
                        fontSize: w * 0.025, color: Color(0xFF58595B)

                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: h*0.1,
                    child: Image.asset('assets/images/job.png'),
                  ),
                  Text(
                    "400 ltrs",
                    style: TextStyle(
                      fontSize: w * 0.1,
                    ),
                  ),Text(
                    AppLocalizations.of(context)!.ofAchaarPrepared,
                    style: TextStyle(
                      fontSize: w * 0.04,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: h * 0.15,
          child: Padding(
            padding: EdgeInsets.only(left: w * 0.12),
            child: SizedBox(
              width: w,
              height: h*0.31,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.1,
                        child: Image.asset('assets/images/icons/settings.png'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, profileSettingsScreenRoute,arguments: grihini);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.profileSettings,
                          style: TextStyle(
                              fontSize: w * 0.05,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.1,
                        child: Image.asset(
                            'assets/images/icons/assignments_done.png'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, taskDetailsScreenRoute);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.assignmentsDone,
                          style: TextStyle(
                              fontSize: w * 0.05,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.1,
                        child: Image.asset(
                            'assets/images/icons/pending_tasks.png'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.myPendingTasks,
                          style: TextStyle(
                              fontSize: w * 0.05,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.1,
                        child: Image.asset('assets/images/icons/new_tasks.png'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.newTasks,
                          style: TextStyle(
                              fontSize: w * 0.05,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: h * 0.02,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0.2, 0.7],
                colors: [
                  Colors.white,
                  Colors.white10,
                ],
              ),
            ),
            width: w,
            child: Padding(
              padding: EdgeInsets.all(w * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.paymentPending,
                            style: TextStyle(
                              fontSize: w * 0.03,
                              color: Colors.grey,
                            )),
                        Text("Rs.5000",
                            style: TextStyle(
                              fontSize: w * 0.05,
                            )),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(AppLocalizations.of(context)!.paymentReceived,
                          style: TextStyle(
                            fontSize: w * 0.03,
                            color: Colors.grey,
                          )),
                      Text("Rs.8000",
                          style: TextStyle(
                            fontSize: w * 0.05,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
