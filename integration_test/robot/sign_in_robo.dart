import 'package:dokan/features/key/sign_in_key.dart';
import 'package:flutter_test/flutter_test.dart';

class SignInRobot {
  final WidgetTester driver;

  SignInRobot({required this.driver});

  void verify() {
    final appRoot = find.byKey(AppsWidgetKeys.appRoot);
    expect(appRoot, findsOneWidget);
    final signInScreen = find.byKey(AppsWidgetKeys.signInPage);
    expect(signInScreen, findsOneWidget);
  }

  Future<void> enterUsername(String username) async {
    final usernameField = find.byKey(AppsWidgetKeys.signInUsername);
    expect(usernameField, findsOneWidget);
    await driver.enterText(usernameField, username);
    await driver.pump();
  }

  Future<void> enterPassword(String password) async {
    final passwordField = find.byKey(AppsWidgetKeys.signInPassword);
    expect(passwordField, findsOneWidget);
    await driver.enterText(passwordField, password);
    await driver.pump();
  }

  Future<void> tapSignInButton() async {
    final signInButton = find.byKey(AppsWidgetKeys.signInBtn);
    expect(signInButton, findsOneWidget);
    await driver.tap(signInButton);
    await driver.pumpAndSettle();
  }

  void verifySignInFailed() {
    final errorSnackBar = find.byKey(AppsWidgetKeys.signInErrorSnackbar);
    expect(errorSnackBar, findsOneWidget);
  }

  void verifySignInSucess() {
    final homeLayoutPage = find.byKey(AppsWidgetKeys.homeLayoutPage);
    expect(homeLayoutPage, findsOneWidget);
  }
}
