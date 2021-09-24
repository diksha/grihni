import 'package:flutter/material.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/widgets/app_bar_yellow.dart';
import 'package:junkiri/ui/widgets/bottom_navigation_two.dart';

class StartTaskScreen extends StatelessWidget {
  const StartTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              bottom: 100,
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.btnLightYellow,
                      Colors.white,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: appBarYellow(context),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          child: Image.asset('assets/images/job.png'),
                        ),
                        Text(
                          "JOB 121A",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      "Groceries for Lapsi 10Kg Received",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,20),
                      child: _startButton(context),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: yellowGradient(),
                height: 100,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: Color(0xFF404041),
                            ),
                            Text(
                              " Home",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFF404041)),
                            ),
                          ],
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Color(0xFF404041),
                            ),
                            Text(
                              " Task",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFF404041)),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _startButton(context) {
  return MaterialButton(
    color: Colors.amber,
    shape: StadiumBorder(),
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Start\nTask",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF404041),
            ),

          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 25.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
            ),
          ),
        ],
      ),
    ),
  );
}
