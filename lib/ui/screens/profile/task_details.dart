import 'package:flutter/material.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';
import 'package:junkiri/ui/widgets/bottom_navigation_two.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h,
            decoration: whiteGradient(),
          ),
          Container(
            height: h * 0.18,
            decoration: yellowGradient(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                appBar(context),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.08),
                  child: Text(
                    "Task Details",
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
            top: h * 0.18,
            bottom: h * 0.11,
            child: Padding(
              padding: EdgeInsets.all(w * 0.06),
              child: SizedBox(
                width: w,
                height: h * 0.31,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.1,
                            child: Image.asset(
                                'assets/images/icons/assignments_done.png'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Assignments Done",
                              style: TextStyle(
                                  fontSize: w * 0.05,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              taskCard(),
                              taskCard(),
                              taskCard(),
                              taskCard(),
                              taskCard(),
                            ],
                          )),
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.1,
                            child: Image.asset(
                                'assets/images/icons/pending_tasks.png'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "My Pending Tasks",
                              style: TextStyle(
                                  fontSize: w * 0.05,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              taskCard(),
                              taskCard(),
                              taskCard(),
                              taskCard(),
                              taskCard(),
                            ],
                          )),
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.1,
                            child:
                                Image.asset('assets/images/icons/new_tasks.png'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "New Tasks",
                              style: TextStyle(
                                  fontSize: w * 0.05,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              taskCard(),
                              taskCard(),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            height: h * 0.11,
            child: Container(
              width: w,
              decoration: yellowGradient(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        child: Image.asset('assets/images/icons/home.png'),
                        width: w * 0.07,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.black54, fontSize: w * 0.06),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Image.asset('assets/images/icons/task.png'),
                        width: w * 0.05,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          " Task",
                          style: TextStyle(
                              color: Colors.black54, fontSize: w * 0.06),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget taskCard() {
  return Padding(
    padding: EdgeInsets.all(w * 0.01),
    child: Container(
      height: h / 8,
      width: w / 3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(w * 0.02)),
        gradient: LinearGradient(
          colors: [
            AppColors.lightYellow,
            AppColors.darkYellow,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(w * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Job 121A",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * 0.04),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(w * 0.01),
                child: Text(
                  "10 Kg",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: w * 0.04),
                ),
              ),
            ),
            Text(
              "Mango Achaar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * 0.03),
            ),
          ],
        ),
      ),
    ),
  );
}
