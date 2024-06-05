import '../../core/api_helper/future_either.dart';
import '../model/profile/user_profile.dart';

abstract class IProfileAPI {
  FutureEitherInt fetchIdByToken({
    required String token,
  });

  FutureEither<UserProfile> fetchProfile();

  FutureEitherVoid updateProfile({
    required String firstName,
    required String lastName,
  });
}
