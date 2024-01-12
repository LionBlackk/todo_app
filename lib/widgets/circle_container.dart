import 'package:flutter/material.dart';

class CircleConTainer extends StatelessWidget {
  const CircleConTainer(
      {super.key,
      this.backgroundOpacity = 0.3,
      this.iconOpacity = 0.3,
      required this.icon,
      required this.color});
  final IconData icon;
  final Color color;
  final double backgroundOpacity;
  final double iconOpacity;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(backgroundOpacity),
          border: Border.all(width: 2, color: color.withOpacity(iconOpacity)),
        ),
        child:
            Center(child: Icon(icon, color: color.withOpacity(iconOpacity))));
  }
}
