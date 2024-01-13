import 'package:equatable/equatable.dart';

import 'package:todo_app/data/data.dart';

class TaskState extends Equatable {
  final List<Task> tasks;

  const TaskState({required this.tasks});
  const TaskState.initial({this.tasks = const []});

  @override
  List<Object?> get props => [tasks];

  TaskState copyWith({
    List<Task>? tasks,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
    );
  }
}
