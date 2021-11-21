import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:image_picker/image_picker.dart';
import 'package:junkiri/repositories/task_repository.dart';
import 'package:junkiri/services/firestore_service.dart';
import 'package:junkiri/services/storage_service.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/router_names.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/repositories/achaar_repository.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskStepYoutube extends ConsumerWidget {
  final Task task;
  final Grihini grihini;
  const TaskStepYoutube({Key? key, required this.task, required this.grihini})
      : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    FirestoreService fireService = FirestoreService();
    final achaar = watch(achaarProvider(task.achaarType));
    final currentTask = watch(currentTaskProvider);
    var taskLocal = task;
    if (currentTask.task == null) {
      currentTask.setTaskId(task.docId);
    } else {
      taskLocal = currentTask.task!;
    }
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: taskLocal != null
          ? achaar.data!.value.steps[taskLocal.currentStep]!.videoId
          : "",
      params: const YoutubePlayerParams(
        startAt: Duration(seconds: 0),
        showControls: true,
        showFullscreenButton: true,
        playsInline: false,
      ),
    );
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
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
            top: h * 0.08,
            height: h * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.job(taskLocal.jobId),
                  style: TextStyle(
                      fontSize: w * 0.08, fontWeight: FontWeight.bold),
                ),
                Text(
                  AppLocalizations.of(context)!.achaarAndAmount(task.achaarType, task.amount),
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
            width: w,
            height: h * 0.35,
            bottom: h * 0.11,
            child: achaar.when(
                data: (achaar) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(w * 0.04),
                          child: AppLocalizations.of(context)!.language ==
                                  "English"
                              ? Text(
                                  achaar.steps[taskLocal.currentStep]!.title_en,
                                  style: TextStyle(
                                    fontSize: w * 0.06,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  achaar.steps[taskLocal.currentStep]!.title_np,
                                  style: TextStyle(
                                    fontSize: w * 0.06,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        achaar.steps[taskLocal.currentStep]!.shouldUpload
                            ? MaterialButton(
                                onPressed: () async {
                                  const snackBar =
                                  SnackBar(content: Text('This function will be available soon...!',textAlign: TextAlign.center,));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                },
                                child: Ink(
                                  width: w * 0.7,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      gradient: LinearGradient(colors: [
                                        AppColors.lightYellow,
                                        AppColors.darkYellow
                                      ])),
                                  child: Padding(
                                    padding: EdgeInsets.all(w * 0.03),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          child: Image.asset(
                                              "assets/images/icons/photo.png"),
                                          width: w * 0.05,
                                        ),
                                        SizedBox(
                                          width: w * 0.015,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.uploadPhoto,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: w * 0.04,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        GestureDetector(
                          onTap: achaar.steps[taskLocal.currentStep + 1] == null
                              ? () async {
                            await fireService
                                .achaarPrepared(task)
                                .whenComplete(() => Navigator.pushReplacementNamed(
                                context, achaarPreparedScreenRoute,
                                arguments: [task, grihini]));
                                }
                              : () {
                                  currentTask.incrementSteps(taskLocal);
                                  Navigator.popAndPushNamed(
                                      context, taskStepYoutubeScreenRoute,
                                      arguments: [task, grihini]);
                                },
                          child: SizedBox(
                            child: Image.asset("assets/images/icons/done.png"),
                            height: h * 0.08,
                          ),
                        ),
                      ],
                    ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text(err.toString()))),
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
                          AppLocalizations.of(context)!.home,
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
                          AppLocalizations.of(context)!.call,
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
                          Navigator.popUntil(context, (route) => false);
                          Navigator.popAndPushNamed(context, taskDetailsScreenRoute,arguments: "PENDING_TASKS");
                        },
                        child: Text(
                          AppLocalizations.of(context)!.task,
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
