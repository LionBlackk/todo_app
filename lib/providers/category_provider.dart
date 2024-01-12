import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/widgets/task_categories.dart';

final categoryProvider =
    StateProvider<TaskCategory>((ref) => TaskCategory.others);
