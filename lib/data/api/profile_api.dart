import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../core/api_helper/future_either.dart';
import '../../core/ui_helper/logger.dart';
import '../iapi/i_profile_api.dart';
import '../model/profile/user_profile.dart';
import '../services/shared_pref_services.dart';
import 'endpoint.dart';

final profileAPIProvider = Provider<ProfileAPI>((ref) {
  return ProfileAPI();
});

final class ProfileAPI implements IProfileAPI {
  final http.Client _client;

  ProfileAPI({
    http.Client? client,
  }) : _client = client ?? http.Client();

  @override
  FutureEitherInt fetchIdByToken({
    required String token,
  }) async {
    try {
      const url = APIEndpoint.profile;

      // header
      final headers = <String, String>{
        'Authorization': 'Bearer $token',
      };
      final apiRes = await _client.get(
        Uri.parse(url),
        headers: headers,
      );

      // decode response

      if (apiRes.statusCode == 200) {
        final decodedResponse = jsonDecode(apiRes.body);
        return right(decodedResponse['id'] as int);
      } else {
        return returnFailure(
          methodName: "[ProfileAPI][fetchIdByToken]",
          message: 'Aw, Snap! Fetching id by token failed. ERR: ${apiRes.statusCode}',
          st: StackTrace.current,
        );
      }
    } catch (e, st) {
      return returnFailure(
        methodName: "[ProfileAPI][fetchIdByToken]",
        e: e,
        st: st,
      );
    }
  }

  @override
  FutureEither<UserProfile> fetchProfile() async {
    try {
      final id = SharedPrefServices.getUserID();
      final token = SharedPrefServices.getToken();

      final url = '${APIEndpoint.updateUser}/$id';
      // header
      final headers = <String, String>{
        'Authorization': 'Bearer $token',
      };

      final apiRes = await _client.post(
        Uri.parse(url),
        headers: headers,
      );

      final decodedResponse = jsonDecode(apiRes.body);
      if (apiRes.statusCode == 200) {
        return right(
          UserProfile.fromJson(decodedResponse),
        );
      } else {
        return returnFailure(
          methodName: "[ProfileAPI][fetchProfile]",
          message:
              decodedResponse["message"] ?? 'Aw, Snap! Fetching profile failed. ERR: ${apiRes.statusCode}',
          st: StackTrace.current,
        );
      }
    } catch (e, st) {
      return returnFailure(
        methodName: "[ProfileAPI][fetchProfile]",
        e: e,
        st: st,
      );
    }
  }

  @override
  FutureEitherVoid updateProfile({
    required String firstName,
    required String lastName,
  }) async {
    try {
      final id = SharedPrefServices.getUserID();
      final token = SharedPrefServices.getToken();
      final url = '${APIEndpoint.updateUser}/$id';
      // header
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final body = jsonEncode({
        'first_name': firstName,
        'last_name': lastName,
      });

      final apiRes = await _client.post(
        Uri.parse(url),
        body: body,
        headers: headers,
      );
      Logger.green("body: $body");

      final decodedResponse = jsonDecode(apiRes.body);
      if (apiRes.statusCode == 200) {
        Logger.green(apiRes.body.toString());
        return right(
          null,
        );
      } else {
        return returnFailure(
          methodName: "[ProfileAPI][fetchProfile]",
          message:
              decodedResponse["message"] ?? 'Aw, Snap! Fetching profile failed. ERR: ${apiRes.statusCode}',
          st: StackTrace.current,
        );
      }
    } catch (e, st) {
      return returnFailure(
        methodName: "[ProfileAPI][fetchProfile]",
        e: e,
        st: st,
      );
    }
  }
}
