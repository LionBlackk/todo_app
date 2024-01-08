import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/circle_container.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleConTainer(task: task),
          const Gap(16),
          Text(task.title,
              style: textTheme.titleMedium
                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(task.time, style: textTheme.titleMedium),
          const Gap(16),
          Visibility(
              visible: !task.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Task to be completed on ${task.time} '),
                  Icon(Icons.check_box, color: task.category.color)
                ],
              )),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          const Gap(16),
          Text(
            task.note.isEmpty
                ? 'There is no additional note for this task'
                : task.note,
            style: textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          Visibility(
              visible: task.isCompleted,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Task completed '),
                  Icon(Icons.check_box, color: Colors.green)
                ],
              ))
        ],
      ),
    );
  }
}
