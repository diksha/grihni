import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/screens/profile/profile.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';

final grihiniProvider = FutureProvider<Grihini>((ref) async {
  FirestoreService _firestoreService = FirestoreService();
  Grihini grihini = await _firestoreService.getGrihini(currentUser);
  return grihini;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final grihini = watch(grihiniProvider);
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: grihini.when(
        data: (grihini) => buildBody(context, grihini),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text(err.toString()),
      ),
    );
  }
}

Widget buildBody(BuildContext context, Grihini grihini) {
  switch (grihini.status) {
    case "training_pending":
      return trainingPending(context, grihini);
    case "trained":
      return Profile(grihini: grihini);
  }
  return const Text("Something Went Wrong...");
}

Widget trainingPending(BuildContext context, Grihini grihini) {
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
          child: appBar(context),
        ),
        Positioned(
          top: h * 0.15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Hello, ${grihini.name}",
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
                  child: Image.asset('assets/images/person.png'),
                  borderRadius: BorderRadius.circular(w*0.5),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: h * 0.02,
          right: 0,
          left: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h*0.16,
                child: Image.asset('assets/images/training.png'),
              ),
              Padding(
                padding: EdgeInsets.all(w*0.08),
                child: Text(
                  "Our Training Experts will contact you soon.",
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

