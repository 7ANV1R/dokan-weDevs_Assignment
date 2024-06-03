import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/api/auth_api.dart';
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

    // send otp
    final api = ref.read(authAPIProvider);
    final res = await api.login(
      username: payload.userName,
      password: payload.password,
    );
    res.fold(
      (l) {
        state = SignInState(state: SignInStateType.error, res: l.message);
      },
      (r) async {
        await SharedPrefServices.setToken(r.token);
        ref.invalidate(userTokenProvider);
        state = const SignInState(state: SignInStateType.success, res: null);
      },
    );
  }
}

// Provider for accessing controller's signIn methods
final signInControllerProvider = NotifierProvider<SignInController, SignInState>(SignInController.new);
