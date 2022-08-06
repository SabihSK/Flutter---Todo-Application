import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateandTimeClass {
  DateTime nowTime = DateTime.now();

  getNowTimeDate() {
    nowTime = DateTime.now();
    return nowTime;
  }

  returnDateTime() {
    nowTime = DateTime.now();
    DateFormat formatter = DateFormat('EEEE, yyyy/MM/dd');
    String formatted = formatter.format(nowTime);
    return formatted;
  }

  Future<DateTime?> pickDate(context) {
    nowTime = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: nowTime,
      firstDate: nowTime,
      lastDate: DateTime(2100),
    );
  }

  Future<TimeOfDay?> pickTime(context) {
    nowTime = DateTime.now();
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: nowTime.hour, minute: nowTime.minute),
    );
  }
}
