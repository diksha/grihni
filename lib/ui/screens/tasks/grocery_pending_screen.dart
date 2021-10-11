import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar_yellow.dart';

import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroceryPending extends ConsumerWidget {
  final Task task;
  const GroceryPending({Key? key, required this.task}) : super(key: key);

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
            child: appBarYellow(context,watch),
          ),
          Positioned(
            width: w,
            top: h * 0.18,
            bottom: h * 0.11,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset("assets/images/job.png"),
                  height: h*0.15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.letsBegin("121 A"),style: TextStyle(fontSize: w*0.06),),
                    SizedBox(
                      width: w*0.02,
                    ),
                    Text("${AppLocalizations.of(context)!.job} 121A",style: TextStyle(fontSize: w*0.06,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(
                  child: Image.asset("assets/images/grocery_pending.png"),
                  height: h*0.2,
                ),
                Padding(
                  padding: EdgeInsets.all(w*0.08),
                  child: Text(AppLocalizations.of(context)!.purchaceManagerWillContactYou,style: TextStyle(fontSize: w*0.05,),textAlign: TextAlign.center,),
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
                          AppLocalizations.of(context)!.home,
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
                          AppLocalizations.of(context)!.task,
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
