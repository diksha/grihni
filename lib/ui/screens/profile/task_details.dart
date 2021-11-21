import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:junkiri/ui/shares/router_names.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/repositories/grihini_repository.dart';
import 'package:junkiri/repositories/task_repository.dart';
import 'package:junkiri/ui/shares/app_colors.dart';
import 'package:junkiri/ui/shares/app_constants.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';
import 'package:junkiri/ui/widgets/bottom_navigation_two.dart';
import 'package:junkiri/ui/widgets/white_gradient.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:junkiri/ui/widgets/yellow_gradient.dart';

class TaskDetails extends ConsumerWidget {
  final String selectedButton;
  const TaskDetails({Key? key, required this.selectedButton}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final grihini = watch(grihiniProvider);
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: grihini.when(
        data: (grihini) => _buildBody(context, grihini, watch, selectedButton),
        error: (err, stack) => Center(child: Text(err.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

Widget _buildBody(
    context, Grihini grihini, ScopedReader watch, selectedButton) {
  List<String> pendingTaskIds = grihini.pendingTasks;
  List<String> completedTaskIds = grihini.completedTasks;
  final pendingTask = watch(tasksProvider(pendingTaskIds));
  final completedTask = watch(tasksProvider(completedTaskIds));
  final newTask = watch(newTaskProvider);
  return Stack(
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
            appBar(context, watch),
            Padding(
              padding: EdgeInsets.only(left: w * 0.08),
              child: Text(
                AppLocalizations.of(context)!.taskDetails,
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
              child: selectedButton == "ASSIGNMENTS_DONE"
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _assignmentsDone(context, completedTask, grihini),
                        _pendingTasks(context, pendingTask, grihini),
                        _newTasks(context, newTask, grihini),
                      ],
                    )
                  : selectedButton == "PENDING_TASKS"
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _pendingTasks(context, pendingTask, grihini),
                            _assignmentsDone(context, completedTask, grihini),
                            _newTasks(context, newTask, grihini),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _newTasks(context, newTask, grihini),
                            _pendingTasks(context, pendingTask, grihini),
                            _assignmentsDone(context, completedTask, grihini),

                          ],
                        ),
            ),
          ),
        ),
      ),
      Positioned(
          bottom: 0, height: h * 0.11, child: bottomNavigationTwo(context)),
    ],
  );
}

taskListGenerator(taskList, grihini, context) {
  List<Widget> taskCards = [];
  for (Task task in taskList) {
    taskCards.add(taskCard(task, grihini, context));
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: taskCards,
  );
}

Widget taskCard(Task task, Grihini grihini, BuildContext context) {
  return GestureDetector(
    onTap: () {
      String oderStatusRoute = taskAcceptScreenRoute;
      switch (task.orderStatus) {
        case OrderStatus.CREATED:
          oderStatusRoute = taskAcceptScreenRoute;
          break;
        case OrderStatus.GROCERY_PENDING:
          oderStatusRoute = groceryPendingScreenRoute;
          break;
        case OrderStatus.GROCERY_DROP_OFF:
          oderStatusRoute = groceryReceivedScreenRoute;
          break;
        case OrderStatus.PREPARING:
          oderStatusRoute = taskStepYoutubeScreenRoute;
          break;
        case OrderStatus.READY_FOR_PICKUP:
          oderStatusRoute = achaarPreparedScreenRoute;
          break;
        case OrderStatus.ORDER_COMPLETED:
          oderStatusRoute = taskCompletedScreenRoute;
          break;
      }
      Navigator.pop(context);
      Navigator.pushNamed(context, oderStatusRoute, arguments: [task, grihini]);
    },
    child: Padding(
      padding: EdgeInsets.all(w * 0.01),
      child: Container(
        height: h / 7.6,
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
                AppLocalizations.of(context)!.job(task.jobId),
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: w * 0.04),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(w * 0.01),
                  child: Text(
                    "${task.amount} ${AppLocalizations.of(context)!.kg}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: w * 0.04),
                  ),
                ),
              ),
              Text(
                "${task.achaarType} ${AppLocalizations.of(context)!.achaar}",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: w * 0.03),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _newTasks(context, newTask, grihini) {
  return Column(
    children: [
      Row(
        children: [
          SizedBox(
            width: w * 0.1,
            child: Image.asset('assets/images/icons/new_tasks.png'),
          ),
          SizedBox(
            width: w * 0.02,
          ),
          Text(
            AppLocalizations.of(context)!.newTasks,
            style: TextStyle(
                fontSize: w * 0.05,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Container(
        width: w,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: newTask.when(
            data: (taskList) => taskListGenerator(taskList, grihini, context),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text(err.toString())),
          ),
        ),
      ),
    ],
  );
}

Widget _pendingTasks(context, pendingTask, grihini) {
  return Column(
    children: [
      Row(
        children: [
          SizedBox(
            width: w * 0.1,
            child: Image.asset('assets/images/icons/pending_tasks.png'),
          ),
          SizedBox(
            width: w * 0.02,
          ),
          Text(
            AppLocalizations.of(context)!.myPendingTasks,
            style: TextStyle(
                fontSize: w * 0.05,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Container(
        width: w,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: pendingTask.when(
            data: (taskList) => taskListGenerator(taskList, grihini, context),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text(err.toString())),
          ),
        ),
      ),
    ],
  );
}

Widget _assignmentsDone(context, completedTask, grihini) {
  return Column(
    children: [
      Row(
        children: [
          SizedBox(
            width: w * 0.1,
            child: Image.asset('assets/images/icons/assignments_done.png'),
          ),
          SizedBox(
            width: w * 0.02,
          ),
          Text(
            AppLocalizations.of(context)!.assignmentsDone,
            style: TextStyle(
                fontSize: w * 0.05,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Container(
        width: w,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: completedTask.when(
            data: (taskList) => taskListGenerator(taskList, grihini, context),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text(err.toString())),
          ),
        ),
      ),
    ],
  );
}
