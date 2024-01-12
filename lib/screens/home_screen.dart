import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/config.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  @override
  Widget build(BuildContext context) {
    final colors = context.colorSchema;
    final deviceSize = context.deviceSize;
    final now = DateTime.now().toLocal();
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
                      DisplayWhiteText(
                          text:
                              DateFormat('MMMM d, yyyy').format(now).toString(),
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      const DisplayWhiteText(
                          text: 'My Todo List',
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ]),
              ),
            ],
          ),
          Positioned(
              top: 170,
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
                    const DisplayListOfTasks(tasks: [
                      Task(
                          title: 'title 1',
                          note: 'Note for this task',
                          category: TaskCategory.education,
                          time: 'Aug, 07',
                          date: 'Aug, 07',
                          isCompleted: false),
                      Task(
                          title: 'title 2',
                          note: 'note',
                          category: TaskCategory.health,
                          time: 'Aug, 07',
                          date: 'Aug, 07',
                          isCompleted: false),
                    ]),
                    const Gap(20),
                    Text('Completed', style: context.textTheme.headlineMedium),
                    const Gap(20),
                    const DisplayListOfTasks(tasks: [
                      Task(
                          title: 'title 1',
                          note: 'note',
                          category: TaskCategory.personal,
                          time: 'Aug, 07',
                          date: 'Aug, 07',
                          isCompleted: true),
                      Task(
                          title: 'title 2',
                          note: '',
                          category: TaskCategory.shopping,
                          time: 'Aug, 07',
                          date: 'Aug, 07',
                          isCompleted: true),
                    ]),
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
}
