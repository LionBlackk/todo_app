import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/task/task.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _repository;

  TaskNotifier(this._repository) : super(const TaskState.initial()) {
    getAllTasks();
  }

  void addTask(Task task) async {
    try {
      await _repository.addTask(task);
      getAllTasks();
    } catch (e) {
      debugPrint('$e');
    }
  }

  void updateTask(Task task) async {
    try {
      await _repository.updateTask(task);
      getAllTasks();
    } catch (e) {
      debugPrint('$e');
    }
  }

  void deleteTask(Task task) async {
    try {
      await _repository.deleteTask(task);
      getAllTasks();
    } catch (e) {
      debugPrint('$e');
    }
  }

  void getAllTasks() async {
    try {
      final tasks = await _repository.getAllTasks();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      debugPrint('$e');
    }
  }
}
