// Payload for SignUp
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/api/auth_api.dart';

class SignUpPayload {
  final String userName;
  final String email;

  final String password;

  const SignUpPayload({
    required this.userName,
    required this.email,
    required this.password,
  });
}

// state type for SignUp
enum SignUpStateType {
  initial,
  loading,
  success,
  error,
}

// state for SignUp
class SignUpState {
  final SignUpStateType state;
  final dynamic res;

  const SignUpState({required this.state, required this.res});
}

// Controller for SignUp
class SignUpController extends Notifier<SignUpState> {
  @override
  SignUpState build() {
    return const SignUpState(state: SignUpStateType.initial, res: null);
  }

  void signUp({required SignUpPayload payload}) async {
    state = const SignUpState(state: SignUpStateType.loading, res: null);

    final api = ref.read(authAPIProvider);
    final res = await api.signup(
      username: payload.userName,
      email: payload.userName,
      password: payload.password,
    );
    res.fold(
      (l) {
        state = SignUpState(state: SignUpStateType.error, res: l.message);
      },
      (r) async {
        state = SignUpState(state: SignUpStateType.success, res: r);
      },
    );
  }
}

// Provider for accessing controller's SignUp methods
final signUpControllerProvider = NotifierProvider<SignUpController, SignUpState>(SignUpController.new);
