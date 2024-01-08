import 'package:flutter/material.dart';

extension BuildContextExtentions on BuildContext {
  ThemeData get _theme => Theme.of(this);
  TextTheme get textTheme => _theme.textTheme;
  ColorScheme get colorSchema => _theme.colorScheme;
  Size get deviceSize => MediaQuery.sizeOf(this);
}
