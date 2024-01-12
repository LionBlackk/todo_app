import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/utils/extensions.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      required this.title,
      this.hintText,
      this.maxLines,
      this.suffixIcon,
      this.readOnly = false});
  final String title;
  final String? hintText;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: context.textTheme.titleLarge),
        const Gap(10),
        TextField(
          readOnly: readOnly,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
