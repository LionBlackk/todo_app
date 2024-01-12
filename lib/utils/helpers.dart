import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@immutable
class Helpers {
  const Helpers._();
  static String timeToString(TimeOfDay time) {
    final DateTime now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(date);
  }
}
