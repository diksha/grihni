import 'package:flutter/material.dart';
import 'package:junkiri/constants/router_names.dart';
import 'package:junkiri/ui/screens/language_select_screen.dart';
import 'package:junkiri/ui/screens/login_screen.dart';
import 'package:junkiri/ui/screens/signup_screen.dart';
import 'package:junkiri/ui/screens/startup_screen.dart';
import 'package:junkiri/ui/screens/tasks/start_task_screen.dart';
import 'package:junkiri/ui/screens/training_pending.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case startupScreenRoute:
      return MaterialPageRoute(builder: (context) => const StartupScreen());
    case languageSelectScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const LanguageSelectScreen());
    case signupScreenRoute:
      return MaterialPageRoute(builder: (context) => const SignupScreen());

    case trainingScreenRoute:
      return MaterialPageRoute(builder: (context) => const TrainingScreen());
    case loginScreenRoute:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case startTaskScreenRoute:
      return MaterialPageRoute(builder: (context) => const StartTaskScreen());

    default:
      return MaterialPageRoute(builder: (context) => const StartupScreen());
  }
}
