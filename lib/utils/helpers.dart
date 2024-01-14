import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/date_provider.dart';

@immutable
class Helpers {
  const Helpers._();
  static String timeToString(TimeOfDay time) {
    final DateTime now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(date);
  }

  static void selectDate(BuildContext context, WidgetRef ref) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: DateTime(2023), lastDate: DateTime(2099));
    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }

  static String dateToString(DateTime date) {
    try {
      return DateFormat.yMMMd().format(date);
    } catch (e) {
      return DateFormat.yMMMd().format(DateTime.now());
    }
  }

  static bool isTaskFromSelectedDate(Task task, DateTime selectedDate) {
    DateTime date = _stringToDateTime(task.date);
    if (date.year == selectedDate.year &&
        date.month == selectedDate.month &&
        date.day == selectedDate.day) {
      return true;
    }
    return false;
  }

  static DateTime _stringToDateTime(String date) {
    DateFormat format = DateFormat.yMMMd();
    return format.parse(date);
  }
}
