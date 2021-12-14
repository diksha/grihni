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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, grihiniTrainingAdminScreenRoute);
              },
              child: const Text("Grihini Training",style: TextStyle(fontSize: 20),),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, groceryPendingAdminScreenRoute);
              },
              child: const Text("Grocery Pending",style: TextStyle(fontSize: 20),),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Add Task",style: TextStyle(fontSize: 20),),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Add Achaar",style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
