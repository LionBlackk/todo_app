import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/circle_container.dart';
import 'package:todo_app/widgets/task_categories.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const categories = TaskCategory.values;
    final selectedCategory = ref.watch(categoryProvider);
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text('Category', style: context.textTheme.titleLarge),
          const Gap(20),
          Expanded(
              child: ListView.separated(
            itemCount: categories.length,
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const Gap(10),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                ref.read(categoryProvider.notifier).state = categories[index];
              },
              child: CircleConTainer(
                  icon: categories[index].icon,
                  color: selectedCategory == categories[index]
                      ? context.colorSchema.primary
                      : categories[index].color.withOpacity(0.3)),
            ),
          ))
        ],
      ),
    );
  }
}
