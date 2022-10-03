import 'package:flutter/material.dart';
import 'package:junkiri/ui/screens/tasks/photo_upload_screen.dart';
import 'package:junkiri/ui/shares/router_names.dart';
import 'package:junkiri/models/grihini.dart';
import 'package:junkiri/models/task.dart';
import 'package:junkiri/ui/screens/profile/home_screen.dart';
import 'package:junkiri/ui/screens/profile/profile_settings.dart';
import 'package:junkiri/ui/screens/profile/task_details.dart';
import 'package:junkiri/ui/screens/startup/language_select_screen.dart';
import 'package:junkiri/ui/screens/auth/login_screen.dart';
import 'package:junkiri/ui/screens/auth/signup_screen.dart';
import 'package:junkiri/ui/screens/startup/startup_screen.dart';
import 'package:junkiri/ui/screens/tasks/achaar_prepared_screen.dart';
import 'package:junkiri/ui/screens/tasks/grocery_received_screen.dart';
import 'package:junkiri/ui/screens/tasks/task_accept_screen.dart';
import 'package:junkiri/ui/screens/tasks/grocery_pending_screen.dart';
import 'package:junkiri/ui/screens/tasks/task_completed.dart';
import 'package:junkiri/ui/screens/tasks/task_step_youtube.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case startupScreenRoute:
      return MaterialPageRoute(builder: (context) => const StartupScreen());
    case languageSelectScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const LanguageSelectScreen());
    case signupScreenRoute:
      return MaterialPageRoute(builder: (context) => const SignupScreen());
    case loginScreenRoute:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case homeScreenRoute:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case profileSettingsScreenRoute:
      var grihini = settings.arguments as Grihini;
      return MaterialPageRoute(
          builder: (context) => ProfileSettings(
                grihini: grihini,
              ));
    case taskAcceptScreenRoute:
      var arguments = settings.arguments as List;
      var task = arguments[0] as Task;
      var grihini = arguments[1] as Grihini;
      return MaterialPageRoute(
          builder: (context) => TaskAccept(
                task: task,
                grihini: grihini,
              ));
    case groceryPendingScreenRoute:
      var arguments = settings.arguments as List;
      var task = arguments[0] as Task;
      var grihini = arguments[1] as Grihini;
      return MaterialPageRoute(
          builder: (context) => GroceryPending(
                task: task,
              ));
    case groceryReceivedScreenRoute:
      var arguments = settings.arguments as List;
      var task = arguments[0] as Task;
      var grihini = arguments[1] as Grihini;
      return MaterialPageRoute(
          builder: (context) => GroceryReceived(
                task: task,
                grihini: grihini,
              ));
    case achaarPreparedScreenRoute:
      var arguments = settings.arguments as List;
      var task = arguments[0] as Task;
      var grihini = arguments[1] as Grihini;
      return MaterialPageRoute(
          builder: (context) => AchaarPrepared(
                task: task,
                grihini: grihini,
              ));
    case taskCompletedScreenRoute:
      var arguments = settings.arguments as List;
      var task = arguments[0] as Task;
      var grihini = arguments[1] as Grihini;
      return MaterialPageRoute(
          builder: (context) => TaskCompleted(
                task: task,
              ));
    case taskDetailsScreenRoute:
      return MaterialPageRoute(builder: (context) => const TaskDetails());

    case photoUploadScreenRoute:
      var uploadLink = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => UploadPhoto(
                uploadLink: uploadLink,
              ));
    case taskStepYoutubeScreenRoute:
      var arguments = settings.arguments as List;
      var task = arguments[0] as Task;
      var grihini = arguments[1] as Grihini;
      return MaterialPageRoute(
          builder: (context) => TaskStepYoutube(
                task: task,
                grihini: grihini,
              ));
    default:
      return MaterialPageRoute(builder: (context) => const StartupScreen());
  }
}
