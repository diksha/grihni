import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:junkiri/ui/shares/router_names.dart';

class AdminHome extends ConsumerWidget {
  const AdminHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, grihiniTrainingScreenRoute);
              },
              child: const Text("Grihini Training"),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text("Grocery Pending"),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text("Add Task"),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text("Add Achaar"),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text("Update Task"),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text("Update Achaar"),
            ),
          ],
        ),
      ),
    );
  }
}
