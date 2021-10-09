import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar_yellow.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';

class GroceryReceived extends ConsumerWidget {
  const GroceryReceived({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
            child: appBarYellow(context, watch),
          ),
          Positioned(
            width: w,
            top: h * 0.18,
            bottom: h * 0.11,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      child: Image.asset("assets/images/job.png"),
                      height: h*0.15,
                    ),
                    SizedBox(height: h*0.02,),
                    Text("JOB 121A",style: TextStyle(fontSize: w*0.06,fontWeight: FontWeight.bold),),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.all(w*0.08),
                  child: Text("Groceries for Lapsi 10Kg Received",style: TextStyle(fontSize: w*0.07,),textAlign: TextAlign.center,),
                ),
                MaterialButton(
                  onPressed: () {
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(w*0.4)),
                        gradient: LinearGradient(
                            colors: [AppColors.lightYellow, AppColors.darkYellow])),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(w*0.09, h*0.03, w*0.08, h*0.03),
                      child: SizedBox(
                        width: w/2.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Start\nTask ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: w*0.08,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: CircleAvatar(
                                backgroundColor: Colors.white70,
                                radius: w * 0.085,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(w*0.4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
