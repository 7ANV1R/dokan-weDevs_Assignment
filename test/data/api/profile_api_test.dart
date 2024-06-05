import 'dart:convert';
import 'package:dokan/core/api_helper/failure.dart';
import 'package:dokan/data/api/endpoint.dart';
import 'package:dokan/data/api/profile_api.dart';
import 'package:dokan/data/model/profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late ProfileAPI repository;
  late MockHttpClient mockClient;

  setUp(() {
    mockClient = MockHttpClient();
    repository = ProfileAPI(
      client: mockClient,
    );
  });

  group('Profile API -', () {
    test('200 OK [fetchProfile]', () async {
      const String token = 'test_token';
      const String id = '100';
      const expectedUrl = '${APIEndpoint.updateUser}/$id';
      final mockResponse = {
        "id": 100,
        "username": "testusername",
        "name": "testusername",
        "email": "test@gmail.com",
        "first_name": "firstname",
        "last_name": "lastname",
      };

      when(
        () => mockClient.post(
          Uri.parse(expectedUrl),
          headers: any(named: 'headers'),
          body: any(named: 'body'),
        ),
      ).thenAnswer((_) async {
        return http.Response(
          jsonEncode(mockResponse),
          200,
          reasonPhrase: 'OK',
        );
      });

      final result = await repository.fetchProfile(token: token, id: id);
      debugPrint(result.fold(
        (l) => "Test Result for // 200 OK [fetchProfile] : Failed\nError: ${l.toString()}",
        (r) => "Test Result for // 200 OK [fetchProfile] : Passed\nResponse: ${r.toString()}",
      ));

      expect(result.isRight(), true);
      expect(result.fold((l) => null, (r) => r), isA<UserProfile>());
    });

    test('401 Unauthorized [fetchProfile]', () async {
      const String token = 'test_token';
      const String id = '100';
      const expectedUrl = '${APIEndpoint.updateUser}/$id';
      final mockResponse = {
        "code": "rest_cannot_edit",
        "message": "Sorry, you are not allowed to edit this user.",
        "data": {"status": 401}
      };

      when(
        () => mockClient.post(
          Uri.parse(expectedUrl),
          headers: any(named: 'headers'),
          body: any(named: 'body'),
        ),
      ).thenAnswer((_) async {
        return http.Response(
          jsonEncode(mockResponse),
          401,
          reasonPhrase: 'Unauthorized',
        );
      });

      final result = await repository.fetchProfile(token: token, id: id);
      debugPrint(result.fold(
        (l) => "Test Result for // 401 Unauthorized [fetchProfile] : Passed\nError: ${l.toString()}",
        (r) => "Test Result for // 401 Unauthorized [fetchProfile] : Failed\nResponse: ${r.toString()}",
      ));

      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => null), isA<Failure>());
    });
  });
}
