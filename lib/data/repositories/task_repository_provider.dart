import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/data.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(taskDatasourceProvider);
  return TaskRepositoryImpl(datasource);
});
