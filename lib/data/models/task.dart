// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:todo_app/widgets/widgets.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final TaskCategory category;
  final String time;
  final String date;
  final bool isCompleted;

  const Task(
      {this.id,
      required this.title,
      required this.note,
      required this.category,
      required this.time,
      required this.date,
      required this.isCompleted});

  @override
  List<Object> get props {
    return [
      id!,
      title,
      note,
      category,
      time,
      date,
      isCompleted,
    ];
  }

  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      note: json['note'],
      category: TaskCategory.stringToTaskCategory(json['category']),
      time: json['time'],
      date: json['date'],
      isCompleted: json['isCompleted'] == 1 ? true : false,
    );
  }

  static Map<String, dynamic> toMap(Task task) {
    return {
      "id": task.id,
      "title": task.title,
      "note": task.note,
      "category": task.category.name,
      "time": task.time,
      "date": task.date,
      "isCompleted": task.isCompleted ? 1 : 0
    };
  }

  Task copyWith({
    int? id,
    String? title,
    String? note,
    TaskCategory? category,
    String? time,
    String? date,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      category: category ?? this.category,
      time: time ?? this.time,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
