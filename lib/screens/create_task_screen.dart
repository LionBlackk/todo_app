import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/widgets.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

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
              const CommonTextField(
                title: 'Task Title',
                hintText: 'Task Title',
              ),
              const Gap(16),
              const SelectCategory(),
              const Gap(16),
              const SelectDateTime(),
              const Gap(16),
              const CommonTextField(
                title: 'Note',
                hintText: 'Task note',
                maxLines: 7,
              ),
              const Gap(50),
              ElevatedButton(
                  onPressed: () {}, child: const DisplayWhiteText(text: 'Save'))
            ],
          ),
        ),
      ),
    );
  }
}
