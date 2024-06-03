import 'dart:convert';

import 'package:dokan/core/api_helper/future_either.dart';
import 'package:dokan/data/api/auth_endpoint.dart';
import 'package:dokan/data/iapi/i_auth_api.dart';
import 'package:dokan/data/model/auth/auth_response_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../core/api_helper/net_request_helper.dart';

class AuthAPI implements IAuthAPI {
  final http.Client _client;

  AuthAPI({
    http.Client? client,
  }) : _client = client ?? http.Client();

  @override
  FutureEither<AuthResponse> login({required String username, required String password}) async {
    try {
      final request = sendRequest(
        url: "${AuthEndpoint.login}?username=$username&password=$password",
        method: ReqMethod.post,
      );

      final response = await _client.send(request);
      // decode response
      final decodedResponse = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        return right(AuthResponse.fromJson(decodedResponse));
      } else {
        return returnFailure(
          '[AuthAPI][login]',
          decodedResponse['message'] ?? 'Aw, Snap! Something went wrong.',
          StackTrace.current,
        );
      }
    } catch (e, st) {
      return returnFailure('[AuthAPI][login]', e, st);
    }
  }

  @override
  FutureEitherVoid register(
      {required String username, required String email, required String password}) async {
    try {
      final request = sendRequest(
        url: AuthEndpoint.register,
        method: ReqMethod.post,
      );
      request.body = jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      });

      final response = await _client.send(request);

      if (response.statusCode == 200) {
        return right(null);
      } else {
        return returnFailure(
          '[AuthAPI][register]',
          'Failed to register',
          StackTrace.current,
        );
      }
    } catch (e, st) {
      return returnFailure('[AuthAPI][register]', e, st);
    }
  }
}
