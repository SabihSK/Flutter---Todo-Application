import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/controllers/theam_controller.dart';
import 'package:todo/utils/colors_constants.dart';
import 'package:todo/view/screens/account_screen.dart';
import 'package:todo/view/screens/upcoming_screen.dart';
import 'package:todo/view/screens/welcom_screen.dart';

class SettingScreen extends ConsumerWidget {
  static const route = "/SettingScreen";
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var themeControllerVariable = ref.watch(themeControllerInstance);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: width * 0.9,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: width * 0.15,
                    decoration: BoxDecoration(
                      color:
                          AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                  "DARK"
                              ? whiteColor
                              : blackColor,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color:
                            AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                    "DARK"
                                ? whiteColor
                                : blackColor,
                        width: 2.0,
                      ),
                    ),
                    child: ListTile(
                        leading: Icon(
                          Icons.calendar_today_outlined,
                          color: AdaptiveTheme.of(context)
                                      .mode
                                      .name
                                      .toUpperCase() ==
                                  "DARK"
                              ? blackColor
                              : whiteColor,
                        ),
                        title: Text(
                          "Today",
                          style: TextStyle(
                              color: AdaptiveTheme.of(context)
                                          .mode
                                          .name
                                          .toUpperCase() ==
                                      "DARK"
                                  ? blackColor
                                  : whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        }),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: width * 0.15,
                    decoration: BoxDecoration(
                      color:
                          AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                  "DARK"
                              ? whiteColor
                              : blackColor,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color:
                            AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                    "DARK"
                                ? whiteColor
                                : blackColor,
                        width: 2.0,
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.calendar_month_rounded,
                        color:
                            AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                    "DARK"
                                ? blackColor
                                : whiteColor,
                      ),
                      title: Text(
                        "Upcoming",
                        style: TextStyle(
                            color: AdaptiveTheme.of(context)
                                        .mode
                                        .name
                                        .toUpperCase() ==
                                    "DARK"
                                ? blackColor
                                : whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, UpcomingScreen.route);
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: width * 0.15,
                    decoration: BoxDecoration(
                      color:
                          AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                  "DARK"
                              ? whiteColor
                              : blackColor,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color:
                            AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                    "DARK"
                                ? whiteColor
                                : blackColor,
                        width: 2.0,
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(
                        AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                "DARK"
                            ? Icons.dark_mode
                            : Icons.light_mode,
                        color:
                            AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                    "DARK"
                                ? blackColor
                                : whiteColor,
                      ),
                      trailing: ElevatedButton(
                        onPressed: () async {
                          await AdaptiveTheme.getThemeMode().then(
                            (value) {
                              if (value!.isDark) {
                                AdaptiveTheme.of(context).setLight();
                              } else {
                                AdaptiveTheme.of(context).setDark();
                              }
                            },
                          );
                          themeControllerVariable.changeTheme();
                        },
                        child: const Text("Enable"),
                      ),
                      title: Text(
                        "${AdaptiveTheme.of(context).mode.name.toUpperCase()} Mode",
                        style: TextStyle(
                            color: AdaptiveTheme.of(context)
                                        .mode
                                        .name
                                        .toUpperCase() ==
                                    "DARK"
                                ? blackColor
                                : whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: width * 0.15,
                    decoration: BoxDecoration(
                      color:
                          AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                  "DARK"
                              ? whiteColor
                              : blackColor,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color:
                            AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                    "DARK"
                                ? whiteColor
                                : blackColor,
                        width: 2.0,
                      ),
                    ),
                    child: ListTile(
                        leading: Icon(
                          Icons.account_circle_rounded,
                          color: AdaptiveTheme.of(context)
                                      .mode
                                      .name
                                      .toUpperCase() ==
                                  "DARK"
                              ? blackColor
                              : whiteColor,
                        ),
                        title: Text(
                          "Account",
                          style: TextStyle(
                              color: AdaptiveTheme.of(context)
                                          .mode
                                          .name
                                          .toUpperCase() ==
                                      "DARK"
                                  ? blackColor
                                  : whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, AccountScreen.route);
                        }),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: width * 0.15,
                    decoration: BoxDecoration(
                      color:
                          AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                  "DARK"
                              ? whiteColor
                              : blackColor,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color:
                            AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                    "DARK"
                                ? whiteColor
                                : blackColor,
                        width: 2.0,
                      ),
                    ),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, WelcomScreen.route, (route) => false);
                        },
                        child: const Text("Log Out"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
