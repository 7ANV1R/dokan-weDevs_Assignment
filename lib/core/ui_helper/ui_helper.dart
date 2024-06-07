import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../theme/palette.dart';

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

showErrorSnackbar(
    {required BuildContext context,
    Key? key,
    String? title,
    String? message,
    SnackBarPosition? snackBarPosition}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      key: key,
      icon: const Icon(Icons.error_outline, color: Colors.white10, size: 120),
      backgroundColor: Palette.errorColor,
      maxLines: 3,
      message: parseHtmlString(message ?? "Aw snap! Something went wrong."),
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
      backgroundColor: Palette.successColor,
      maxLines: 4,
      message: parseHtmlString(message ?? "Aw snap! Something went wrong."),
      textAlign: TextAlign.left,
    ),
    displayDuration: const Duration(milliseconds: 2500),
    snackBarPosition: snackBarPosition ?? SnackBarPosition.top,
  );
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;
  return parsedString;
}

extension ContextExtension on BuildContext {
  ColorScheme get scheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
  Size get screenSize => MediaQuery.of(this).size;
  bool get isDarkModeOn => Theme.of(this).brightness == Brightness.dark;
}
