import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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

showErrorSnackbar(
    {required BuildContext context, String? title, String? message, SnackBarPosition? snackBarPosition}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      icon: const Icon(Icons.error_outline, color: Colors.white10, size: 120),
      backgroundColor: Colors.red,
      maxLines: 4,
      message: message ?? "Aw snap! Something went wrong.",
      textAlign: TextAlign.left,
    ),
    snackBarPosition: snackBarPosition ?? SnackBarPosition.bottom,
  );
}

showSuccessSnackbar(
    {required BuildContext context, String? title, String? message, SnackBarPosition? snackBarPosition}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      icon: const Icon(Icons.sentiment_very_satisfied, color: Colors.white10, size: 120),
      backgroundColor: Colors.green,
      maxLines: 4,
      message: message ?? "Aw snap! Something went wrong.",
      textAlign: TextAlign.left,
    ),
    displayDuration: const Duration(milliseconds: 2500),
    snackBarPosition: snackBarPosition ?? SnackBarPosition.top,
  );
}

extension ContextExtension on BuildContext {
  ColorScheme get scheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
  Size get screenSize => MediaQuery.of(this).size;
  bool get isDarkModeOn => Theme.of(this).brightness == Brightness.dark;
}
