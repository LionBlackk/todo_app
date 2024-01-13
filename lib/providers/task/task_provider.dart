import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/task/task.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});
