import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:todo/helper/date_time_calculator.dart';

final homeControllerInstance =
    ChangeNotifierProvider(((ref) => HomeController()));

class HomeController extends ChangeNotifier {
  List? todayTasks = [];

  // ignore: prefer_typing_uninitialized_variables
  var dateAndTime;
  HomeController() {
    dateAndTime = DateandTimeClass().returnDateTime();
    notifyListeners();
  }

//? --- Add task in list ---
  void addInTodayList(title, description, priority, scheduled, hourlyReminder) {
    todayTasks?.add(
      {
        "title": title,
        "description": description,
        "priority": priority,
        "scheduled": scheduled,
        "hourlyReminder": hourlyReminder
      },
    );
    notifyListeners();
  }

  void updateIndex(
      index, title, description, priority, scheduled, hourlyReminder) {
    todayTasks![index] = {
      "title": title,
      "description": description,
      "priority": priority,
      "scheduled": scheduled,
      "hourlyReminder": hourlyReminder
    };
    notifyListeners();
  }

  void deleteIndex(index) {
    todayTasks!.removeAt(index);
    notifyListeners();
  }
}
