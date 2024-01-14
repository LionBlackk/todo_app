import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/task/task.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks(
      {super.key, required this.tasks, this.isCompletedTasks = false});
  final List<Task> tasks;
  final bool isCompletedTasks;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final double height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final String emptyTasksAlert = isCompletedTasks
        ? 'There is no completed task yet'
        : 'There is no task to todo!';

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child:
                  Text(emptyTasksAlert, style: context.textTheme.headlineSmall))
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return InkWell(
                    onLongPress: () {
                      AppAlerts.deleteAlertDialog(context, ref, task);
                    },
                    onTap: () async {
                      await showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return TaskDetails(task: task);
                          });
                    },
                    child: TaskTile(
                      task: task,
                      onCompleted: (value) async {
                        await ref
                            .read(tasksProvider.notifier)
                            .updateTask(task)
                            .then((value) {
                          AppAlerts.displaySnackbar(
                              context,
                              !tasks[index].isCompleted
                                  ? 'Task completed'
                                  : 'Task incompleted');
                        });
                      },
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
