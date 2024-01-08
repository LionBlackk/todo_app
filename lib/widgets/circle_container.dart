import 'package:flutter/material.dart';
import 'package:todo_app/data/data.dart';

class CircleConTainer extends StatelessWidget {
  const CircleConTainer(
      {super.key,
      required this.task,
      this.backgroundOpacity = 0.3,
      this.iconOpacity = 0.3});
  final Task task;
  final double backgroundOpacity;
  final double iconOpacity;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: task.category.color.withOpacity(backgroundOpacity),
          border: Border.all(
              width: 2, color: task.category.color.withOpacity(iconOpacity)),
        ),
        child: Center(
            child: Icon(task.category.icon,
                color: task.category.color.withOpacity(iconOpacity))));
  }
}
