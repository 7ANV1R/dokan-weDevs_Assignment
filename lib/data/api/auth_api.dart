import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../core/api_helper/future_either.dart';
import '../../core/ui_helper/logger.dart';
import '../iapi/i_auth_api.dart';
import '../model/auth/auth_response_model.dart';
import 'auth_endpoint.dart';

final authAPIProvider = Provider<AuthAPI>((ref) {
  return AuthAPI();
});

final class AuthAPI implements IAuthAPI {
  final http.Client _client;

  AuthAPI({
    http.Client? client,
  }) : _client = client ?? http.Client();

  @override
  FutureEither<AuthResponse> login({required String username, required String password}) async {
    try {
      final url = '${AuthEndpoint.login}?username=$username&password=$password';
      final apiRes = await _client.post(Uri.parse(url));

      // decode response
      final decodedResponse = jsonDecode(apiRes.body);
      Logger.green('decodedResponse: $decodedResponse');
      if (apiRes.statusCode == 200) {
        return right(AuthResponse.fromJson(decodedResponse));
      } else {
        return returnFailure(
          methodName: "[AuthAPI][login]",
          message: decodedResponse['message'] ?? 'Aw, Snap! Something went wrong.',
          st: StackTrace.current,
        );
      }
    } catch (e, st) {
      return returnFailure(
        methodName: "[AuthAPI][login]",
        e: e,
        st: st,
      );
    }
  }

  @override
  FutureEitherString signup(
      {required String username, required String email, required String password}) async {
    try {
      const url = AuthEndpoint.register;
      final body = jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      });
      final apiRes = await _client.post(Uri.parse(url), body: body);

      // decoded response
      final decodedResponse = jsonDecode(apiRes.body);

      if (apiRes.statusCode == 200) {
        return right(decodedResponse['message'] ?? 'User registered successfully');
      } else {
        return returnFailure(
          methodName: '[AuthAPI][register]',
          message: decodedResponse['message'] ?? 'Aw, Snap! Something went wrong.',
          st: StackTrace.current,
        );
      }
    } catch (e, st) {
      return returnFailure(
        methodName: '[AuthAPI][register]',
        e: e,
        st: st,
      );
    }
  }
}
