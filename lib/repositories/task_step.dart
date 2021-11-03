import 'package:flutter/material.dart';

class TaskStep extends ChangeNotifier {
  int taskStep;
  TaskStep([this.taskStep = 0]);

  void nextStep() {
    taskStep++;
    notifyListeners();
  }
}