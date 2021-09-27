import 'package:flutter/material.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/ui/screens/profile/trained.dart';
import 'package:junkiri/ui/screens/profile/training_pending.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.grihini}) : super(key: key);
  final Grihini grihini;

  @override
  Widget build(BuildContext context) {
    switch (grihini.status){
      case "training_pending":
        return TrainingPending(grihini: grihini);
      case "trained":
        return Trained(grihini: grihini);
    }
    return const Text("Something Went Wrong");
  }
}
