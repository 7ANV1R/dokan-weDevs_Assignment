import 'package:flutter/material.dart' show Key;

/// This key will be used in `integration_tests` to find widgets.
///
class AppsWidgetKeys {
  static const appRoot = Key('app_root');
  static const signInPage = Key('sign_in_page');
  static const signInUsername = Key('sign_in_username');
  static const signInPassword = Key('sign_in_password');
  static const signInBtn = Key('sign_in_btn');
  static const signInErrorSnackbar = Key('sign_in_error_snackbar');
  static const homeLayoutPage = Key('home_layout_page');
}
