import 'package:flutter/material.dart';
import 'package:todo/view/screens/account_screen.dart';
import 'package:todo/view/screens/email_log_in_screen.dart';
import 'package:todo/view/screens/home.dart';
import 'package:todo/view/screens/settings_screen.dart';
import 'package:todo/view/screens/sign_up_screen.dart';
import 'package:todo/view/screens/upcoming_screen.dart';
import 'package:todo/view/screens/welcom_screen.dart';
import 'package:todo/view/screens/your_tasks.dart';
import 'package:todo/view/screens/user_name_log_in_screen_dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // ignore: unused_local_variable
    var args = settings.arguments;

    switch (settings.name) {

      //!-----Welcom Screen------
      case WelcomScreen.route:
        return MaterialPageRoute(builder: (_) => const WelcomScreen());

      //!-----SignUPScreen Screen------
      case SignUPScreen.route:
        return MaterialPageRoute(builder: (_) => const SignUPScreen());

      //!-----EmailLogInScreen Screen------
      case EmailLogInScreen.route:
        return MaterialPageRoute(builder: (_) => const EmailLogInScreen());

      //!-----UserNameLogInScreen Screen------
      case UserNameLogInScreen.route:
        return MaterialPageRoute(builder: (_) => const UserNameLogInScreen());

      //!-----Home-------
      case HomeScreen.route:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      //!-----Your Tasks Screen------
      case YourTasksScreen.route:
        return MaterialPageRoute(builder: (_) => YourTasksScreen(isEdit: args));

      //!-----Setting Screen------
      case SettingScreen.route:
        return MaterialPageRoute(builder: (_) => const SettingScreen());

      //!-----Upcoming Screen------
      case UpcomingScreen.route:
        return MaterialPageRoute(builder: (_) => const UpcomingScreen());

      //!-----Account Screen------
      case AccountScreen.route:
        return MaterialPageRoute(builder: (_) => const AccountScreen());

      //!-----default------
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
