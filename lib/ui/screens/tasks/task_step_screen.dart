import 'package:flutter/material.dart';
class TaskStepScreen extends StatelessWidget {
  const TaskStepScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(),
            Positioned(
              top: 0,
              left: -75,
              right: -75,
              child: Column(
                children: [
                  Image.asset('assets/images/background002.png'),
                  MaterialButton(
                    color: Colors.amber,
                    shape: const StadiumBorder(),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                      child: Text(
                        "Signup",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
