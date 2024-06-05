import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/api/auth_api.dart';
import '../../../../data/api/profile_api.dart';
import '../../../../data/services/shared_pref_services.dart';
import '../../../layout/app_root.dart';

// Payload for signIn
class SignInPayload {
  final String userName;
  final String password;

  const SignInPayload({required this.userName, required this.password});
}

// state type for signIn
enum SignInStateType {
  initial,
  loading,
  success,
  error,
}

// state for signIn
class SignInState {
  final SignInStateType state;
  final dynamic res;

  const SignInState({required this.state, required this.res});
}

// Controller for signIn
class SignInController extends Notifier<SignInState> {
  @override
  SignInState build() {
    return const SignInState(state: SignInStateType.initial, res: null);
  }

  void signIn({required SignInPayload payload}) async {
    state = const SignInState(state: SignInStateType.loading, res: null);

    final api = ref.read(authAPIProvider);
    final res = await api.login(
      username: payload.userName,
      password: payload.password,
    );
    res.fold(
      (err) {
        state = SignInState(state: SignInStateType.error, res: err.message.split('.').first);
      },
      (authResponse) async {
        /// i had to call another api to get user id sad :)
        ///
        /// if i save the user id in shared pref during sign in then
        /// i can avoid calling this `user id fetch` api for profile and update user api

        final idResponse = await ref.read(profileAPIProvider).fetchIdByToken(
              token: authResponse.token,
            );
        idResponse.fold(
          (idResponseErr) {
            // split response by first . and return first value
            state = SignInState(state: SignInStateType.error, res: idResponseErr.message.split('.').first);
          },
          (id) async {
            await SharedPrefServices.setLoginCredential(authResponse.token, id.toString());
            ref.invalidate(userTokenProvider);
            state = const SignInState(state: SignInStateType.success, res: null);
          },
        );
      },
    );
  }
}

// Provider for accessing controller's signIn methods
final signInControllerProvider = NotifierProvider<SignInController, SignInState>(SignInController.new);
