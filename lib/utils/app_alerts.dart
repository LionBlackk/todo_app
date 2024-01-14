import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/task/task.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/display_white_text.dart';

class AppAlerts {
  AppAlerts._();
  static void displaySnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: DisplayWhiteText(
        text: message,
        fontSize: 16,
      ),
      backgroundColor: context.colorSchema.primary,
    ));
  }

  static void deleteAlertDialog(
      BuildContext context, WidgetRef ref, Task task) async {
    Widget cancelButton = TextButton(
        onPressed: () {
          context.pop();
        },
        child: const Text('Cancel'));
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(tasksProvider.notifier).deleteTask(task).then((value) {
          displaySnackbar(context, 'Delete task successful');
          context.pop();
        });
      },
      child: const Text('Yes'),
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Do you want to delete this task?'),
      actions: [deleteButton, cancelButton],
    );
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
