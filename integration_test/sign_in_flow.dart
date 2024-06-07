import 'package:dokan/data/services/shared_pref_services.dart';
import 'package:dokan/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'robot/sign_in_robo.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late SignInRobot robot;

  group('SignIn -', () {
    setUpAll(() async {
      /// We are making sure that the shared preferences are cleared before running the tests
      /// to avoid any side effects from previous runs
      /// also this will make sure that the user is not authenticated

      await SharedPrefServices.init();
      await SharedPrefServices.clear();
    });

    testWidgets("Wrong User trying to sign in", (driver) async {
      await app.main();
      await driver.pumpAndSettle();

      robot = SignInRobot(driver: driver);

      robot.verify();
      await robot.enterUsername('ihopethisusernameisnotregistered');
      await robot.enterPassword('ihopethispasswordisnotvalidforthisusername');
      await robot.tapSignInButton();
      robot.verifySignInFailed();
    });

    testWidgets("Valid User trying to sign in", (driver) async {
      await app.main();
      await driver.pumpAndSettle();

      robot = SignInRobot(driver: driver);

      robot.verify();
      await robot.enterUsername('demo_driver_tanvir');
      await robot.enterPassword('87654321');
      await robot.tapSignInButton();
      robot.verifySignInSucess();
    });
  });
}
