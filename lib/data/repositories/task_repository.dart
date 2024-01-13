import 'package:todo_app/data/data.dart';

abstract class TaskRepository {
  Future<List<Task>> getAllTasks();
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(Task task);
}
