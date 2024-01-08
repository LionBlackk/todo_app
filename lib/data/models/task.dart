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
}
