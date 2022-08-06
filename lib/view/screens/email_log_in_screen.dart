import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/utils/colors_constants.dart';
import 'package:todo/view/screens/home.dart';

class EmailLogInScreen extends ConsumerWidget {
  static const route = "/EmailLogInScreen";
  const EmailLogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                "Email Log In",
                style: TextStyle(
                  fontSize: width * 0.1,
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Container(
                height: width * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  border: Border.all(
                    color: AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                            "DARK"
                        ? whiteColor
                        : blackColor,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.03, right: width * 0.01),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.email),
                      // suffixIcon: Icon(Icons.mode_edit_outline_outlined),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Container(
                height: width * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  border: Border.all(
                    color: AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                            "DARK"
                        ? whiteColor
                        : blackColor,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.03, right: width * 0.01),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.lock),
                      // suffixIcon: Icon(Icons.mode_edit_outline_outlined),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeScreen.route, (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  primary: AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                          "DARK"
                      ? blackColor
                      : whiteColor,
                  side: BorderSide(
                    width: 2,
                    color: AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                            "DARK"
                        ? whiteColor
                        : blackColor,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                            "DARK"
                        ? whiteColor
                        : blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
