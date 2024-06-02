import 'package:flutter/material.dart';

Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

ThemeData getThemeData(BuildContext context) {
  return Theme.of(context);
}

ColorScheme getColorScheme(BuildContext context) {
  return Theme.of(context).colorScheme;
}

TextTheme getTextTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

void showColoredSnackBar(
    {required BuildContext context,
    required String msg,
    Color? color,
    Color? textColor,
    Duration? duration}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: getTextTheme(context).labelLarge!.copyWith(color: textColor ?? Colors.white),
      ),
      duration: duration ?? const Duration(milliseconds: 4000),
      backgroundColor: color ?? context.scheme.primary,
    ),
  );
}

extension ContextExtension on BuildContext {
  ColorScheme get scheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
  Size get screenSize => MediaQuery.of(this).size;
  bool get isDarkModeOn => Theme.of(this).brightness == Brightness.dark;
}
