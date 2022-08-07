import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/controllers/home_controller.dart';
import 'package:todo/controllers/your_task_controller.dart';
import 'package:todo/utils/colors_constants.dart';
import 'package:expandable/expandable.dart';

class YourTasksScreen extends ConsumerStatefulWidget {
  static const route = "/YourTasksScreen";

  var isEdit;
  YourTasksScreen({Key? key, this.isEdit}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _YourTasksScreenState();
}

class _YourTasksScreenState extends ConsumerState<YourTasksScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    widget.isEdit.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var youtaskControllerVariable = ref.watch(youtaskControllerInstance);
    var homeControllerVariable = ref.watch(homeControllerInstance);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Task"),
        centerTitle: true,
        actions: [
          widget.isEdit[0]
              ? IconButton(
                  onPressed: () {
                    homeControllerVariable.deleteIndex(widget.isEdit[1]);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: width * 0.9,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.01,
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
                    child: TextField(
                      controller: youtaskControllerVariable.title,
                      // onChanged: (value) {
                      //   //Do something with the user input.
                      // },
                      decoration: const InputDecoration(
                        hintText: 'Title',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: width * 0.4,
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
                    child: TextField(
                      controller: youtaskControllerVariable.description,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      // onChanged: (value) {
                      //   //Do something with the user input.
                      // },
                      decoration: const InputDecoration(
                        hintText: 'Description',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
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
                  child: ExpandablePanel(
                    header: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Priority"),
                    ),
                    collapsed: const SizedBox(),
                    // Container(
                    //   color:
                    //       AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                    //               "DARK"
                    //           ? whiteColor
                    //           : blackColor,
                    //   height: 2,
                    //   width: width,
                    // ),
                    expanded: Column(
                      children: [
                        Container(
                          color: AdaptiveTheme.of(context)
                                      .mode
                                      .name
                                      .toUpperCase() ==
                                  "DARK"
                              ? whiteColor
                              : blackColor,
                          height: 2,
                          width: width,
                        ),
                        Theme(
                            data: ThemeData(
                              unselectedWidgetColor: Colors.red,
                            ),
                            child: RadioListTile(
                              value: 1,
                              groupValue: youtaskControllerVariable.val,
                              onChanged: (value) {
                                youtaskControllerVariable.changePriority(1);
                              },
                              title: Text(
                                "High Priority",
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
                              toggleable: true,
                              controlAffinity: ListTileControlAffinity.leading,
                            )),
                        Theme(
                            data: ThemeData(
                              unselectedWidgetColor: Colors.yellow,
                            ),
                            child: RadioListTile(
                              value: 2,
                              groupValue: youtaskControllerVariable.val,
                              onChanged: (value) {
                                youtaskControllerVariable.changePriority(2);
                              },
                              title: Text(
                                "Medium Priority",
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
                              toggleable: true,
                              controlAffinity: ListTileControlAffinity.leading,
                            )),
                        Theme(
                            data: ThemeData(
                              unselectedWidgetColor: Colors.green,
                            ),
                            child: RadioListTile(
                              value: 3,
                              groupValue: youtaskControllerVariable.val,
                              onChanged: (value) {
                                youtaskControllerVariable.changePriority(3);
                              },
                              title: Text(
                                "Low Priority",
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
                              toggleable: true,
                              controlAffinity: ListTileControlAffinity.leading,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: width * 0.3,
                  width: width,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Scheduled",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        color:
                            AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                    "DARK"
                                ? whiteColor
                                : blackColor,
                        height: 2,
                      ),
                      Center(
                        child: youtaskControllerVariable.pickDateTime == null
                            ? TextButton(
                                child: const Text(
                                  "Select Date and Time",
                                ),
                                onPressed: () {
                                  youtaskControllerVariable
                                      .pickDateTimeFunction(context);
                                },
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    ('${youtaskControllerVariable.pickDateTime?.day}/${youtaskControllerVariable.pickDateTime?.month}/${youtaskControllerVariable.pickDateTime?.year} ${youtaskControllerVariable.pickDateTime?.hour}:${youtaskControllerVariable.pickDateTime?.minute}')
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      youtaskControllerVariable
                                          .pickDateTimeFunction(context);
                                    },
                                    icon: const Icon(
                                      Icons.edit_calendar,
                                    ),
                                  ),
                                ],
                              ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  width: width,
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
                  child: RadioListTile(
                    value: false,
                    groupValue: youtaskControllerVariable.hourlyReminder,
                    onChanged: (value) {
                      youtaskControllerVariable.changeHourlyReminder();
                    },
                    title: Text(
                      "Hourly Reminder",
                      style: TextStyle(
                        color:
                            AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                                    "DARK"
                                ? whiteColor
                                : blackColor,
                      ),
                    ),
                    toggleable: true,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                IconButton(
                  onPressed: () {
                    if (widget.isEdit[0]) {
                      if (youtaskControllerVariable.title.text.isNotEmpty &&
                          youtaskControllerVariable
                              .description.text.isNotEmpty &&
                          youtaskControllerVariable.pickDateTime != null) {
                        homeControllerVariable.updateIndex(
                            widget.isEdit[1],
                            youtaskControllerVariable.title.text,
                            youtaskControllerVariable.description.text,
                            youtaskControllerVariable.val,
                            youtaskControllerVariable.pickDateTime,
                            youtaskControllerVariable.hourlyReminder);
                        Navigator.pop(context);
                      }

                      //  homeControllerVariable.todayTasks[widget.]
                    } else {
                      if (youtaskControllerVariable.title.text.isNotEmpty &&
                          youtaskControllerVariable
                              .description.text.isNotEmpty &&
                          youtaskControllerVariable.pickDateTime != null) {
                        homeControllerVariable.addInTodayList(
                            youtaskControllerVariable.title.text,
                            youtaskControllerVariable.description.text,
                            youtaskControllerVariable.val,
                            youtaskControllerVariable.pickDateTime,
                            youtaskControllerVariable.hourlyReminder);
                        Navigator.pop(context);
                      }
                    }
                  },
                  icon: Icon(
                    widget.isEdit[0] ? Icons.edit : Icons.add_circle_outline,
                  ),
                  iconSize: width * 0.15,
                ),
                SizedBox(
                  height: height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
