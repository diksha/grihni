import 'package:flutter/material.dart';
import 'package:junkiri/constants/router_names.dart';
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
      return MaterialPageRoute(builder: (context) => const ProfileSettings());
    case taskAcceptScreenRoute:
      return MaterialPageRoute(builder: (context) => const TaskAccept());
    case groceryPendingScreenRoute:
      return MaterialPageRoute(builder: (context) => const GroceryPending());
    case groceryReceivedScreenRoute:
      return MaterialPageRoute(builder: (context) => const GroceryReceived());
    case achaarPreparedScreenRoute:
      return MaterialPageRoute(builder: (context) => const AchaarPrepared());
    case taskDetailsScreenRoute:
      return MaterialPageRoute(builder: (context) => const TaskDetails());

    default:
      return MaterialPageRoute(builder: (context) => const StartupScreen());
  }
}
