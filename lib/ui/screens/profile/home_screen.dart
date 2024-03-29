import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/repositories/grihini_repository.dart';
import 'package:junkiri/ui/screens/profile/profile.dart';
import 'package:junkiri/ui/screens/profile/task_details.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:junkiri/ui/widgets/app_bar_without_back_button.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final grihini = watch(grihiniProvider);
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.refresh(grihiniProvider);
          // Handle refresh.
        },
        child: grihini.when(
          data: (grihini) => buildBody(context, grihini, watch),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text(err.toString())),
        ),
      ),
    );
  }
}

Widget buildBody(BuildContext context, Grihini grihini, ScopedReader watch) {
  w = MediaQuery.of(context).size.width;
  h = MediaQuery.of(context).size.height;
  if (grihini.currentTask != null) {
    return Stack(children: [
      Positioned(
        top: -h * 0.08,
        left: -w * 0.05,
        right: -w * 0.05,
        child: Image.asset('assets/images/background001.png'),
      ),
      Positioned(
        width: w,
        top: h * 0.02,
        child: appBarWithoutBackButton(context, watch, grihini),
      ),
      Positioned(
          bottom: h * 0.05,
          right: 0,
          left: 0,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.16,
                  child: Text('Click on the Pending Task'),
                ),
                taskCard(grihini.currentTask!, grihini, context),
              ]))
    ]);
  }
  switch (grihini.status) {
    case "training_pending":
      return trainingPending(context, grihini, watch);
    case "trained":
      return Profile(grihini: grihini);
  }
  return const Text("Something Went Wrong...");
}

Widget trainingPending(
    BuildContext context, Grihini grihini, ScopedReader watch) {
  return Scaffold(
    body: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -h * 0.08,
          left: -w * 0.05,
          right: -w * 0.05,
          child: Image.asset('assets/images/background001.png'),
        ),
        Positioned(
          width: w,
          top: h * 0.02,
          child: appBarWithoutBackButton(context, watch, grihini),
        ),
        Positioned(
          top: h * 0.15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${AppLocalizations.of(context)!.hello}, ${grihini.name}",
                style: TextStyle(
                  fontSize: w * 0.07,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: h * 0.03,
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
        ),
        Positioned(
          bottom: h * 0.05,
          right: 0,
          left: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h * 0.16,
                child: Image.asset('assets/images/training_pending.png'),
              ),
              Padding(
                padding: EdgeInsets.all(w * 0.08),
                child: Text(
                  AppLocalizations.of(context)!.contactYouSoon,
                  style: TextStyle(fontSize: w * 0.05, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
