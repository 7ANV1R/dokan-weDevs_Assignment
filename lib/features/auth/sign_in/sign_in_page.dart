import '../../key/sign_in_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/flat_btn.dart';
import '../../../common/input_box.dart';
import '../../../common/pass_input_box.dart';
import '../../../core/const/asset_const.dart';
import '../../../core/theme/palette.dart';
import '../../../core/ui_helper/space_helper.dart';
import '../../../core/ui_helper/ui_helper.dart';
import '../../../routes/router.dart';
import '../widgets/social_login_btn_row.dart';
import 'controller/sign_in_controller.dart';

class SignInPage extends StatefulHookConsumerWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  // form key
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final signUpMessage = useState<Object?>(null);
    final userNameController = useTextEditingController();
    final passwordController = useTextEditingController();

    /// listen to the state of the `signInControllerProvider` for showing loading and error
    ref.listen(signInControllerProvider, (prev, next) async {
      if (next.state == SignInStateType.loading) {
        isLoading.value = true;
      } else if (next.state == SignInStateType.error) {
        // show error snackbar
        isLoading.value = false;
        showErrorSnackbar(
          key: AppsWidgetKeys.signInErrorSnackbar,
          context: context,
          message: next.res.toString(),
        );
      } else if (next.state == SignInStateType.success) {
        isLoading.value = false;
        // we can show a login success snackbar here if we want
      }
    });
    return Scaffold(
      key: AppsWidgetKeys.signInPage,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kGapSpaceXXXL,

                /// [Logo]
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetConst.dokanLogo,
                    width: context.screenSize.width * 0.4,
                  ),
                ),
                kGapSpaceXXXXL,
                Text(
                  'Sign In',
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),

                // [Sign Up Message]
                if (signUpMessage.value != null) ...[
                  kGapSpaceS,
                  Text(
                    '${signUpMessage.value}.\nPlease login now.',
                    style: context.textTheme.labelLarge!.copyWith(
                      color: Palette.secondaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],

                /// [Form Fields]
                kGapSpaceXXL,
                InputBox(
                  key: AppsWidgetKeys.signInUsername,
                  controller: userNameController,
                  hintText: 'Username / Email',
                  textInputAction: TextInputAction.next,
                  prefixAssetPath: AssetConst.userIcon,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                kGapSpaceL,
                PasswordInputBox(
                  key: AppsWidgetKeys.signInPassword,
                  controller: passwordController,
                  hintText: 'Password',
                  prefixAssetPath: AssetConst.passwordIcon,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                kGapSpaceL,
                GestureDetector(
                  onTap: () {
                    showErrorSnackbar(
                        context: context, message: "Can't remember your password? Unlucky TBH 💀");
                  },
                  child: Text(
                    'Forgot Password?',
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: Palette.lightFontColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),

                /// [Login Button]
                kGapSpaceXXL,
                FlatBtn(
                  key: AppsWidgetKeys.signInBtn,
                  onTap: () => handleLogin(
                    username: userNameController.text,
                    password: passwordController.text,
                  ),
                  height: 65,
                  isLoading: isLoading.value,
                  label: Text(
                    'Login',
                    style: context.textTheme.titleMedium!.copyWith(
                      color: Palette.onPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: Palette.primaryColor,
                ),

                /// [Social Login Buttons]
                kGapSpaceXXXL,
                const SocialLoginBtnRow(),

                /// [Create new account]
                kGapSpaceXXL,
                TextButton(
                  onPressed: () async {
                    // push register page
                    final res = await context.pushNamed(RouteOf.registerPage);
                    if (res != null) {
                      signUpMessage.value = res;
                    } else {
                      signUpMessage.value = null;
                    }
                  },
                  child: Text(
                    'Create New Account',
                    style: context.textTheme.titleMedium!.copyWith(
                      color: Palette.regularFontColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleLogin({
    required String username,
    required String password,
  }) async {
    if (_formKey.currentState!.validate()) {
      final payload = SignInPayload(userName: username, password: password);
      ref.read(signInControllerProvider.notifier).signIn(payload: payload);
    }
  }
}
