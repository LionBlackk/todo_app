import 'package:flutter/material.dart';
import 'package:todo_app/utils/utils.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({super.key, this.height, this.child});
  final double? height;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final colors = context.colorSchema;
    return Container(
      width: deviceSize.width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colors.primaryContainer,
      ),
      child: child,
    );
  }
}
