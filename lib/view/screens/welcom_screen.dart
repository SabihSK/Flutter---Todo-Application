import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/controllers/theam_controller.dart';
import 'package:todo/utils/colors_constants.dart';
import 'package:todo/view/screens/email_log_in_screen.dart';
import 'package:todo/view/screens/home.dart';
import 'package:todo/view/screens/settings_screen.dart';
import 'package:todo/view/screens/sign_up_screen.dart';
import 'package:todo/view/screens/user_name_log_in_screen.dart';

class WelcomScreen extends ConsumerWidget {
  static const route = "/";

  const WelcomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var themeControllerVariable = ref.watch(themeControllerInstance);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calendar_today_rounded,
                size: 100,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                "Today's Tasks",
                style: TextStyle(
                  fontSize: width * 0.1,
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUPScreen.route);
                      },
                      style: ElevatedButton.styleFrom(
                        primary:
                            AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                    "DARK"
                                ? blackColor
                                : whiteColor,
                        side: BorderSide(
                          width: 2,
                          color: AdaptiveTheme.of(context)
                                      .mode
                                      .name
                                      .toUpperCase() ==
                                  "DARK"
                              ? whiteColor
                              : blackColor,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AdaptiveTheme.of(context)
                                        .mode
                                        .name
                                        .toUpperCase() ==
                                    "DARK"
                                ? whiteColor
                                : blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, EmailLogInScreen.route);
                      },
                      style: ElevatedButton.styleFrom(
                        primary:
                            AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                    "DARK"
                                ? blackColor
                                : whiteColor,
                        side: BorderSide(
                          width: 2,
                          color: AdaptiveTheme.of(context)
                                      .mode
                                      .name
                                      .toUpperCase() ==
                                  "DARK"
                              ? whiteColor
                              : blackColor,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: Text(
                          "Email Log In",
                          style: TextStyle(
                            color: AdaptiveTheme.of(context)
                                        .mode
                                        .name
                                        .toUpperCase() ==
                                    "DARK"
                                ? whiteColor
                                : blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, UserNameLogInScreen.route);
                      },
                      style: ElevatedButton.styleFrom(
                        primary:
                            AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                    "DARK"
                                ? blackColor
                                : whiteColor,
                        side: BorderSide(
                          width: 2,
                          color: AdaptiveTheme.of(context)
                                      .mode
                                      .name
                                      .toUpperCase() ==
                                  "DARK"
                              ? whiteColor
                              : blackColor,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: Text(
                          "Username Log In",
                          style: TextStyle(
                            color: AdaptiveTheme.of(context)
                                        .mode
                                        .name
                                        .toUpperCase() ==
                                    "DARK"
                                ? whiteColor
                                : blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     await AdaptiveTheme.getThemeMode().then(
              //       (value) {
              //         if (value!.isDark) {
              //           AdaptiveTheme.of(context).setLight();
              //         } else {
              //           AdaptiveTheme.of(context).setDark();
              //         }
              //       },
              //     );
              //     themeControllerVariable.changeTheme();
              //   },
              //   child: const Text("Enable"),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
