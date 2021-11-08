import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:junkiri/repositories/task_repository.dart';
import 'package:junkiri/ui/shares/router_names.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/repositories/achaar_repository.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskStepYoutube extends ConsumerWidget {
  final String docId;
  final Grihini grihini;
  const TaskStepYoutube({Key? key, required this.docId, required this.grihini})
      : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentTask = watch(currentTaskProvider(docId));
    final Task task = currentTask.data!.value;
    final achaar = watch(achaarProvider(task.achaarType));
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: achaar.data!.value.steps[task.currentStep]!.videoId,
      params: const YoutubePlayerParams(
        startAt: Duration(seconds: 0),
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
            top: -h * 0.01,
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
                Text(
                  task.jobId,
                  style: TextStyle(
                      fontSize: w * 0.06, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${task.achaarType} ${task.amount} Kg",
                  style: TextStyle(fontSize: w * 0.08),
                ),
                Padding(
                  padding: EdgeInsets.all(w * 0.09),
                  child: YoutubePlayerIFrame(
                    controller: _controller,
                    aspectRatio: 16 / 9,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: h * 0.11,
            height: h * 0.2,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(w * 0.04),
                  child: achaar.when(
                      data: (achaar) => Text(
                            achaar.steps[task.currentStep]!.title,
                            style: TextStyle(
                              fontSize: w * 0.06,
                            ),
                            textAlign: TextAlign.center,
                          ),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (err, stack) =>
                          Center(child: Text(err.toString()))),
                ),
                GestureDetector(
                  onTap: () async {
                    await fireService.completedTheStep(currentTask.data!.value);
                    Navigator.pushReplacementNamed(
                        context, taskStepYoutubeScreenRoute,
                        arguments: [task.docId, grihini]);
                  },
                  child: SizedBox(
                    child: Image.asset("assets/images/icons/done.png"),
                    height: h * 0.1,
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
                        onPressed: () {},
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
