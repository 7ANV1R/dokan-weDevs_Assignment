import '../../core/api_helper/future_either.dart';
import '../model/auth/auth_response_model.dart';

abstract class IAuthAPI {
  FutureEitherString signup({
    required String username,
    required String email,
    required String password,
  });

  FutureEither<AuthResponse> login({
    required String username,
    required String password,
  });
}
