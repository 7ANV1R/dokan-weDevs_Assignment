import 'package:flutter/gestures.dart';
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
import 'controller/sign_up_controller.dart';
import 'widgets/avatar_with_upload_btn.dart';

class SignUpPage extends StatefulHookConsumerWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final userNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    /// listen to the state of the `signUpControllerProvider` for showing loading and error
    ref.listen(signUpControllerProvider, (prev, next) async {
      if (next.state == SignUpStateType.loading) {
        isLoading.value = true;
      } else if (next.state == SignUpStateType.error) {
        // show error snackbar
        isLoading.value = false;
        showColoredSnackBar(
          context: context,
          color: Palette.errorColor,
          msg: next.res.toString(),
        );
      } else if (next.state == SignUpStateType.success) {
        isLoading.value = false;
        // context.pop with value
        // this value will indicate that the user has
        // successfully signed up now login for homepage
        context.pop(next.res);
      }
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// [Avatar]

              const AvatarWithUploadBtn(),

              /// [Form Fields]
              kGapSpaceXXL,
              InputBox(
                controller: userNameController,
                textInputAction: TextInputAction.next,
                hintText: 'Username',
                prefixAssetPath: AssetConst.userIcon,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
              ),
              kGapSpaceL,
              InputBox(
                controller: emailController,
                textInputAction: TextInputAction.next,
                hintText: 'Email',
                prefixAssetPath: AssetConst.mailIcon,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
                    return 'Please provide a valid email';
                  }
                  return null;
                },
              ),
              kGapSpaceL,
              PasswordInputBox(
                controller: passwordController,
                textInputAction: TextInputAction.next,
                hintText: 'Password',
                prefixAssetPath: AssetConst.passwordIcon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              kGapSpaceL,
              PasswordInputBox(
                hintText: 'Confirm Password',
                prefixAssetPath: AssetConst.passwordIcon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (value != passwordController.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
              ),

              /// [Sign Up Button]
              kGapSpaceXL,
              FlatBtn(
                onTap: () {
                  handleSignUp(
                    userName: userNameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
                height: 65,
                isLoading: isLoading.value,
                label: Text(
                  'Sign Up',
                  style: context.textTheme.titleMedium!.copyWith(
                    color: Palette.onPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                backgroundColor: Palette.primaryColor,
              ),

              /// [Social Login Buttons]
              kGapSpaceXXL,
              const SocialLoginBtnRow(
                isBusy: true,
              ),

              /// [Sign In Button]
              kGapSpaceXXL,
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: context.textTheme.titleMedium!.copyWith(
                      color: Palette.regularFontColor,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      // ontap

                      TextSpan(
                        text: 'Login',
                        style: context.textTheme.titleMedium!.copyWith(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pop();
                          },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void handleSignUp({required String userName, required String email, required String password}) {
    if (_formKey.currentState!.validate()) {
      final payload = SignUpPayload(userName: userName, email: email, password: password);
      ref.read(signUpControllerProvider.notifier).signUp(payload: payload);
    }
  }
}
