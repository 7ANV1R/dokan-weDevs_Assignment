import 'dart:convert';

import 'package:dokan/data/api/auth_api.dart';
import 'package:dokan/data/api/auth_endpoint.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

Client client = Client();

class MockHttpClient extends Mock implements Client {}

void main() {
  late AuthAPI repository;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    repository = AuthAPI(
      client: mockHttpClient,
    );
  });

  group(
    'Auth API -',
    () {
      /// [Login]
      test(
        '200 Login',
        () async {
          const username = 'testusername';
          const password = '12345678';
          const url = '${AuthEndpoint.login}?username=$username&password=$password';
          final jsonResponse = {
            "token": "testjwttoken",
            "user_email": "xxxxxxxxx@gmail.com",
            "user_nicename": "xxxxxxxusername",
            "user_display_name": "testusername"
          };

          when(
            () => mockHttpClient.post(
              Uri.parse(url),
            ),
          ).thenAnswer(
            (invocation) async {
              return Response(jsonEncode(jsonResponse), 200, reasonPhrase: 'OK');
            },
          );
          final res = await repository.login(
            username: username,
            password: password,
          );
          debugPrint(res.fold(
            (l) => "Test Result for // 200 Login : Passed\nError: ${l.message}",
            (r) => "Test Result for // 200 Login : Failed\nResponse: ${r.token}",
          ));
          expect(res.isRight(), true);
        },
      );

      test(
        '403 Forbidden [Wrong username] ',
        () async {
          const username = 'wrongusername';
          const password = '12345678';
          const url = '${AuthEndpoint.login}?username=$username&password=$password';

          final jsonResponse = {
            "code": "[jwt_auth] invalid_username",
            "message":
                "<strong>Error:</strong> The username <strong>testusernamenotavaiable</strong> is not registered on this site. If you are unsure of your username, try your email address instead.",
            "data": {"status": 403}
          };

          when(
            () => mockHttpClient.post(
              Uri.parse(url),
            ),
          ).thenAnswer(
            (invocation) async {
              return Response(jsonEncode(jsonResponse), 403, reasonPhrase: 'Forbidden');
            },
          );
          final res = await repository.login(
            username: username,
            password: password,
          );
          debugPrint(res.fold(
            (l) => "Test Result for // 403 Forbidden [Wrong username] : Passed\nError: ${l.message}",
            (r) => "Test Result for // 403 Forbidden [Wrong username] : Failed\nResponse: ${r.token}",
          ));
          expect(res.isLeft(), true);
        },
      );

      test(
        '403 Forbidden [Wrong password] ',
        () async {
          const username = 'testusername';
          const password = 'wrongpassword';
          const url = '${AuthEndpoint.login}?username=$username&password=$password';

          final jsonResponse = {
            "code": "[jwt_auth] incorrect_password",
            "message":
                "<strong>Error:</strong> The password you entered for the username <strong>testusername</strong> is incorrect. <a href=\"https://apptest.dokandemo.com/wp-login.php?action=lostpassword\">Lost your password?</a>",
            "data": {"status": 403}
          };

          when(
            () => mockHttpClient.post(
              Uri.parse(url),
            ),
          ).thenAnswer(
            (invocation) async {
              return Response(jsonEncode(jsonResponse), 403, reasonPhrase: 'Forbidden');
            },
          );
          final res = await repository.login(
            username: username,
            password: password,
          );

          debugPrint(res.fold(
            (l) => "Test Result for // 403 Forbidden [Wrong password] : Passed\nError: ${l.message}",
            (r) => "Test Result for // 403 Forbidden [Wrong password] : Failed\nResponse: ${r.token}",
          ));

          expect(res.isLeft(), true);
        },
      );

      /// [SignUp]
      test(
        '200 SignUp',
        () async {
          const username = 'testusername';
          const email = 'testusername@gmail.com';
          const password = '12345678';
          const url = AuthEndpoint.register;
          final body = jsonEncode(
            {
              'username': username,
              'email': email,
              'password': password,
            },
          );
          final jsonResponse = {
            "code": 200,
            "message": "User 'testusername' Registration was Successful",
          };

          when(
            () => mockHttpClient.post(
              Uri.parse(url),
              body: body,
            ),
          ).thenAnswer(
            (invocation) async {
              return Response(jsonEncode(jsonResponse), 200, reasonPhrase: 'OK');
            },
          );
          final res = await repository.signup(
            username: username,
            password: password,
            email: email,
          );
          debugPrint(res.fold(
            (l) => "Test Result for // 200 SignUp : Failed\nError: ${l.message}",
            (r) => "Test Result for // 200 SignUp : Passed\nResponse: $r",
          ));
          expect(res.isRight(), true);
        },
      );
    },
  );
}
