import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/repositories/grihini_repository.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/shares/app_constants.dart';

class GroceryPendingAdmin extends ConsumerWidget {
  const GroceryPendingAdmin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final trainingGrihinies = watch(trainingGrihiniProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grocery Pending Admin"),
      ),
      body: Container(
        child: trainingGrihinies.when(
          data: (trainingGrihiniList) =>
              grihiniListGenerator(trainingGrihiniList, context),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text(err.toString())),
        ),
      ),
    );
  }
}

Widget grihiniListGenerator(trainingGrihiniList, context) {
  List<Widget> trainingGrihiniCards = [];
  for (Grihini grihini in trainingGrihiniList) {
    trainingGrihiniCards.add(_trainingGrihiniCard(grihini, context));
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: trainingGrihiniCards,
  );
}

Widget _trainingGrihiniCard(Grihini grihini, context) {
  FirestoreService fireService = FirestoreService();
  bool buttonActive = true;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      child: ListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Name: " + grihini.name),
            Text("uid: " + grihini.uid),
          ],
        ),
        subtitle: MaterialButton(
          onPressed: buttonActive?() {
            fireService.grihiniTrained(grihini).whenComplete(() {

            });
          }:null,
          child: const Text("Trained"),
          color: Colors.amberAccent,
        ),
      ),
    ),
  );
}
