import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_svg/svg.dart';
import 'package:junkiri/ui/shares/router_names.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar_without_back_button.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share/share.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key, required this.grihini}) : super(key: key);
  final Grihini grihini;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
              appBarWithoutBackButton(context, watch,grihini),
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
          height: h * 0.4,
          width: w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(w * 0.08),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: w * 0.12,
                      child: ClipRRect(
                        child: grihini.profilePicture==""?SvgPicture.asset('assets/images/svg/person.svg'):Image.network(grihini.profilePicture),
                        borderRadius: BorderRadius.circular(h * 0.8),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    grihini.name.length>9? Text(
                      grihini.name.substring(0,8)+"...",
                      style: TextStyle(
                          fontSize: w * 0.06, color: Color(0xFF58595B)),
                    ):Text(
                      grihini.name,
                      style: TextStyle(
                          fontSize: w * 0.06, color: Color(0xFF58595B)),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    MaterialButton(onPressed: (){
                      Clipboard.setData(ClipboardData(text: grihini.uid));
                      Share.share(grihini.uid, subject: 'This is my uid.').whenComplete(() {
                        Scaffold.of(context).showSnackBar(
                            const SnackBar(content:Text("Uid copied to clipboard",textAlign: TextAlign.center,)));
                      });
                    },child: const Text("Share Uid"),),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: w * 0.3,
                        height: h * 0.002,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * 0.1,
                    child: Image.asset('assets/images/job.png'),
                  ),
                  Text(
                    "400 Kg",
                    style: TextStyle(
                      fontSize: w * 0.1,
                    ),
                  ),
                  Text(
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
          top: h * 0.5,
          child: Padding(
            padding: EdgeInsets.only(left: w * 0.12),
            child: SizedBox(
              width: w,
              height: h * 0.31,
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
                          Navigator.pushNamed(
                              context, profileSettingsScreenRoute,
                              arguments: grihini);
                        },
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.profileSettings,
                              style: TextStyle(
                                  fontSize: w * 0.05,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: w * 0.38,
                                height: h * 0.002,
                                color: Colors.grey,
                              ),
                            )
                          ],
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
                          Navigator.pushNamed(context, taskDetailsScreenRoute,arguments: "ASSIGNMENTS_DONE");
                        },
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.assignmentsDone,
                              style: TextStyle(
                                  fontSize: w * 0.05,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: w * 0.45,
                                height: h * 0.002,
                                color: Colors.grey,
                              ),
                            )
                          ],
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
                        onPressed: () {
                          Navigator.pushNamed(context, taskDetailsScreenRoute,arguments: "PENDING_TASKS");
                        },
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.myPendingTasks,
                              style: TextStyle(
                                  fontSize: w * 0.05,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: w * 0.45,
                                height: h * 0.002,
                                color: Colors.grey,
                              ),
                            )
                          ],
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
                        onPressed: () {
                          Navigator.pushNamed(context, taskDetailsScreenRoute,arguments: "NEW_TASK");
                        },
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.newTasks,
                              style: TextStyle(
                                  fontSize: w * 0.05,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: w * 0.28,
                                height: h * 0.002,
                                color: Colors.grey,
                              ),
                            )
                          ],
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
