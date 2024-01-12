import 'package:flutter/material.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/extensions.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final double iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final double backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: task.category.color.withOpacity(backgroundOpacity),
                border: Border.all(
                    width: 2,
                    color: task.category.color.withOpacity(iconOpacity)),
              ),
              child: Center(
                  child: Icon(task.category.icon,
                      color: task.category.color.withOpacity(iconOpacity)))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title,
                      style: textTheme.titleMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: fontWeight,
                          decoration: textDecoration)),
                  Text(task.time,
                      style: textTheme.titleMedium
                          ?.copyWith(decoration: textDecoration)),
                ],
              ),
            ),
          ),
          Checkbox(value: task.isCompleted, onChanged: (value) {})
        ],
      ),
    );
  }
}
