import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_svg/svg.dart';
import 'package:junkiri/ui/shares/router_names.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar_without_back_button.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              appBarWithoutBackButton(context, watch),
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
                        child: SvgPicture.asset('assets/images/svg/person.svg'),
                        borderRadius: BorderRadius.circular(w * 0.5),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    grihini.name.length > 9
                        ? Text(
                            grihini.name.substring(0, 8) + "...",
                            style: TextStyle(
                                fontSize: w * 0.06, color: Color(0xFF58595B)),
                          )
                        : Text(
                            grihini.name,
                            style: TextStyle(
                                fontSize: w * 0.06, color: Color(0xFF58595B)),
                          ),
                    SizedBox(
                      height: h * 0.01,
                    ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          Navigator.pushNamed(context, taskDetailsScreenRoute);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          Navigator.pushNamed(context, taskDetailsScreenRoute);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          Navigator.pushNamed(context, taskDetailsScreenRoute);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
      ],
    );
  }
}
