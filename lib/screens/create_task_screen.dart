import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/config/config.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/providers/task/task.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorSchema;
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(
          text: 'Add New Task',
          fontSize: 28,
        ),
        backgroundColor: colors.primary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                title: 'Task Title',
                hintText: 'Task Title',
                controller: _titleController,
              ),
              const Gap(16),
              const SelectCategory(),
              const Gap(16),
              const SelectDateTime(),
              const Gap(16),
              CommonTextField(
                title: 'Note',
                hintText: 'Task note',
                maxLines: 7,
                controller: _noteController,
              ),
              const Gap(50),
              ElevatedButton(
                  onPressed: _createTask,
                  child: const DisplayWhiteText(text: 'Save'))
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final String title = _titleController.text.trim();
    final String note = _noteController.text.trim();
    final TaskCategory category = ref.watch(categoryProvider);
    final TimeOfDay time = ref.watch(timeProvider);
    final DateTime date = ref.watch(dateProvider);
    if (title.isNotEmpty) {
      final Task newTask = Task(
          title: title,
          note: note,
          category: category,
          time: Helpers.timeToString(time),
          date: DateFormat.yMMMd().format(date),
          isCompleted: false);
      await ref.read(tasksProvider.notifier).createTask(newTask).then((value) {
        AppAlerts.displaySnackbar(context, 'Task create successfully');
        context.go(RoutesLocation.home);
      });
    } else {
      AppAlerts.displaySnackbar(context, 'Title cannot be empty');
    }
  }
}
