import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/config.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/date_provider.dart';
import 'package:todo_app/providers/task/task.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorSchema;
    final deviceSize = context.deviceSize;
    final selectedDate = ref.watch(dateProvider);
    final taskState = ref.watch(tasksProvider);
    final completedTasks = _completedTasks(taskState.tasks, ref);
    final incompletedTasks = _incompletedTasks(taskState.tasks, ref);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: deviceSize.width,
                height: deviceSize.height * 0.3,
                decoration: BoxDecoration(
                  color: colors.primary,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Helpers.selectDate(context, ref);
                        },
                        child: DisplayWhiteText(
                            text: Helpers.dateToString(selectedDate),
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      const DisplayWhiteText(
                          text: 'My Todo List',
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ]),
              ),
            ],
          ),
          Positioned(
              top: 150,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DisplayListOfTasks(tasks: incompletedTasks),
                    const Gap(20),
                    Text('Completed', style: context.textTheme.headlineMedium),
                    const Gap(20),
                    DisplayListOfTasks(
                      tasks: completedTasks,
                      isCompletedTasks: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                        onPressed: () {
                          context.push(RoutesLocation.createTask);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DisplayWhiteText(text: 'Add New Task'),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  List<Task> _completedTasks(List<Task> tasks, WidgetRef ref) {
    final selectedDay = ref.watch(dateProvider);
    final List<Task> filteredTasks = [];
    for (var task in tasks) {
      if (task.isCompleted) {
        final taskOfDay = Helpers.isTaskFromSelectedDate(task, selectedDay);
        if (taskOfDay) {
          filteredTasks.add(task);
        }
      }
    }
    return filteredTasks;
  }

  List<Task> _incompletedTasks(List<Task> tasks, WidgetRef ref) {
    final selectedDay = ref.watch(dateProvider);
    final List<Task> filteredTasks = [];
    for (var task in tasks) {
      if (!task.isCompleted) {
        final taskOfDay = Helpers.isTaskFromSelectedDate(task, selectedDay);
        if (taskOfDay) {
          filteredTasks.add(task);
        }
      }
    }
    return filteredTasks;
  }
}
