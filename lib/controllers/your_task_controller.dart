import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/helper/date_time_calculator.dart';

final youtaskControllerInstance =
    ChangeNotifierProvider.autoDispose(((ref) => YoutaskController()));

class YoutaskController extends ChangeNotifier {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  int? val = 1;
  DateTime? pickDateTime;
  bool hourlyReminder = true;

  void changePriority(value) {
    val = value;
    notifyListeners();
  }

  void changeHourlyReminder() {
    if (hourlyReminder) {
      hourlyReminder = false;
    } else {
      hourlyReminder = true;
    }
    notifyListeners();
  }

  Future pickDateTimeFunction(context) async {
    DateTime? date = await DateandTimeClass().pickDate(context);
    if (date == null) return;

    TimeOfDay? time = await DateandTimeClass().pickTime(context);
    if (time == null) return;

    var dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    pickDateTime = dateTime;

    notifyListeners();
  }

  void setEditValues(index, data) {
    title.text = data['title'];
    description.text = data['description'];
    val = data['priority'];
    pickDateTime = data['scheduled'];
    hourlyReminder = data['hourlyReminder'];

    notifyListeners();
  }

  void disposValues() {
    title.text = '';
    description.text = '';
    val = 1;
    pickDateTime = null;
    hourlyReminder = true;

    notifyListeners();
  }
}
