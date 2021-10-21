import 'package:flutter/material.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskStepYoutube extends StatelessWidget {
  final Task task;
  final Grihini grihini;
  final String youtubeVideoId = "PL8DsqBzICQZJq_g77ybt1bObjwDIqqhry";
  final String message = "Tie your hair and cover with Scaf";
  const TaskStepYoutube({Key? key,required this.task,required this.grihini}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: youtubeVideoId,
      params: const YoutubePlayerParams(
        startAt: Duration(seconds: 6),
        showControls: true,
        showFullscreenButton: true,
        playsInline: false,
      ),
    );
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    FirestoreService fireService = FirestoreService();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h,
            decoration: whiteGradient(),
          ),
          Positioned(
            top: -h*0.01,
            right: -w * 0.14,
            left: -w * 0.14,
            child: Container(
              child: Image.asset("assets/images/background001.png"),
            ),
          ),
          Positioned(
            width: w,
            top: h * 0.15,
            bottom: h * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Job 121A",style: TextStyle(fontSize: w*0.06,fontWeight: FontWeight.bold),),
                Text("Lapsi 10 Kg",style: TextStyle(fontSize: w*0.08),),
                Padding(
                  padding: EdgeInsets.all(w*0.09),
                  child: YoutubePlayerIFrame(
                    controller: _controller,
                    aspectRatio: 16 / 9,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom:  h * 0.11,
            height: h*0.2,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(w*0.04),
                  child: Text(message,style: TextStyle(fontSize: w*0.06,),textAlign: TextAlign.center,),
                ),
                GestureDetector(
                  onTap: (){
                    fireService.completedTheStep(task);
                  },
                  child: SizedBox(
                    child: Image.asset("assets/images/icons/done.png"),
                    height: h*0.1,
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
                        width: w * 0.06,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, homeScreenRoute);
                        },
                        child: Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.black54, fontSize: w * 0.05),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Image.asset('assets/images/icons/call.png'),
                        width: w * 0.06,
                      ),
                      TextButton(
                        onPressed: () {

                        },
                        child: Text(
                          "Call",
                          style: TextStyle(
                              color: Colors.black54, fontSize: w * 0.05),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Image.asset('assets/images/icons/task.png'),
                        width: w * 0.04,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, taskDetailsScreenRoute);
                        },
                        child: Text(
                          " Task",
                          style: TextStyle(
                              color: Colors.black54, fontSize: w * 0.05),
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
