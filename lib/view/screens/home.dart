import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/controllers/home_controller.dart';
import 'package:todo/controllers/your_task_controller.dart';
import 'package:todo/helper/date_time_calculator.dart';
import 'package:todo/utils/colors_constants.dart';
import 'package:todo/view/screens/settings_screen.dart';
import 'package:todo/view/screens/your_tasks.dart';

class HomeScreen extends ConsumerWidget {
  static const route = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var homeControllerVariable = ref.watch(homeControllerInstance);
    var youtaskControllerVariable = ref.watch(youtaskControllerInstance);

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.13,
                height: width * 0.1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                      color:
                          AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                  "DARK"
                              ? blackColor
                              : whiteColor,
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    homeControllerVariable.dateAndTime,
                    style: TextStyle(
                      color:
                          AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                  "DARK"
                              ? blackColor
                              : whiteColor,
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SettingScreen.route);
                },
                icon: Icon(
                  Icons.settings,
                  color: AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                          "DARK"
                      ? blackColor
                      : whiteColor,
                ),
                iconSize: width * 0.07,
              )
            ],
          ),
        ),
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
                Text(
                  '${homeControllerVariable.todayTasks!.isEmpty ? 'No' : homeControllerVariable.todayTasks?.length} task today!',
                  style: TextStyle(
                    color: AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                            "DARK"
                        ? greyWhiteFontColor
                        : greyFontColor,
                    fontSize: width * 0.065,
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeControllerVariable.todayTasks?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return ((homeControllerVariable
                                    .todayTasks![index]['scheduled'].day) ==
                                DateandTimeClass().getNowTimeDate().day &&
                            (homeControllerVariable
                                    .todayTasks![index]['scheduled'].month ==
                                DateandTimeClass().getNowTimeDate().month))
                        ? Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  youtaskControllerVariable.setEditValues(
                                      index,
                                      homeControllerVariable
                                          .todayTasks![index]);
                                  Navigator.pushNamed(
                                    context,
                                    YourTasksScreen.route,
                                    arguments: [
                                      true,
                                      index,
                                    ],
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border.all(
                                      color: AdaptiveTheme.of(context)
                                                  .mode
                                                  .name
                                                  .toUpperCase() ==
                                              "DARK"
                                          ? whiteColor
                                          : blackColor,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      (homeControllerVariable.todayTasks![index]
                                              ['title'])
                                          .toString(),
                                    ),
                                    subtitle: Text(
                                      ('by ${homeControllerVariable.todayTasks![index]['scheduled'].day}/${homeControllerVariable.todayTasks![index]['scheduled'].month}/${homeControllerVariable.todayTasks![index]['scheduled'].year} ${homeControllerVariable.todayTasks![index]['scheduled'].hour}:${homeControllerVariable.todayTasks![index]['scheduled'].minute}')
                                          .toString(),
                                    ),
                                    trailing: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: homeControllerVariable
                                                            .todayTasks![index]
                                                        ['priority'] ==
                                                    1
                                                ? Colors.red
                                                : homeControllerVariable
                                                                .todayTasks![
                                                            index]['priority'] ==
                                                        2
                                                    ? Colors.yellow
                                                    : Colors.green,
                                            width: 3.0,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20))),
                                      child: const SizedBox(),
                                    ),
                                  ),
                                ),
                              ),
                              homeControllerVariable.todayTasks!.length > 1
                                  ? homeControllerVariable.todayTasks![index] ==
                                          (homeControllerVariable
                                              .todayTasks!.last)
                                      ? const SizedBox()
                                      : SizedBox(
                                          height: height * 0.015,
                                        )
                                  : const SizedBox(),
                            ],
                          )
                        : const SizedBox();
                  },
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  height: width * 0.15,
                  decoration: BoxDecoration(
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
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.03, right: width * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Add Tasks",
                          style: TextStyle(fontSize: width * 0.05),
                        ),
                        IconButton(
                          onPressed: () {
                            youtaskControllerVariable.disposValues();
                            Navigator.pushNamed(
                              context,
                              YourTasksScreen.route,
                              arguments: [false],
                            );
                          },
                          icon: Icon(
                            Icons.add_circle_outline,
                            size: width * 0.08,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
