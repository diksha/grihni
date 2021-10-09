import 'package:flutter/material.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar_yellow.dart';
import 'package:junkiri/ui/widgets/bottom_navigation_two.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';

class TaskAccept extends StatelessWidget {
  final Task task;
  const TaskAccept({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: h,
            decoration: whiteGradient(),
          ),
          Positioned(
            top: 0,
            width: w,
            child: Container(
              height: h * 0.18,
              child: appBarYellow(context),
            ),
          ),
          Positioned(
            top: h*0.18,
            child: Container(
              height: h * 0.4,
              child: Column
                (
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        child: Image.asset("assets/images/job.png"),
                        height: h*0.1,
                      ),
                      Text(
                        "Job ${task.jobId}",
                        style: TextStyle(fontSize: w * 0.06,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  Text(
                    "Lapsi ${task.amount} Kg",
                    style: TextStyle(fontSize: w * 0.09),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            height: h * 0.3,
            child: Container(
              width: w,
              decoration: yellowGradient(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: -h * 0.0435,
                    child: MaterialButton(
                      shape: StadiumBorder(),
                      color: const Color(0xFF97C85C),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.all(w * 0.05),
                        child: Row(
                          children: [
                            SizedBox(
                              child:
                                  Image.asset('assets/images/icons/accept.png'),
                              height: h * 0.03,
                            ),
                            Text(
                              " ACCEPT",
                              style: TextStyle(
                                  color: Colors.white, fontSize: w * 0.06),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: h * 0.08,
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      color: const Color(0xFFEF4F44),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.all(w * 0.05),
                        child: Row(
                          children: [
                            SizedBox(
                              child: Image.asset(
                                  'assets/images/icons/decline.png'),
                              height: h * 0.03,
                            ),
                            Text(
                              " DECLINE",
                              style: TextStyle(
                                  color: Colors.white, fontSize: w * 0.06),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: h * 0.03,
                    child: Container(
                      width: w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                child:
                                    Image.asset('assets/images/icons/home.png'),
                                width: w * 0.07,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Home",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: w * 0.06),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                child:
                                    Image.asset('assets/images/icons/task.png'),
                                width: w * 0.05,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  " Task",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: w * 0.06),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                overflow: Overflow.visible,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
