import '../../../core/const/asset_const.dart';
import '../../../core/theme/palette.dart';
import '../../../core/ui_helper/space_helper.dart';
import '../../../core/ui_helper/ui_helper.dart';
import '../../../routes/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/flat_btn.dart';
import '../../../common/input_box.dart';
import '../../../common/pass_input_box.dart';
import '../widgets/social_login_btn_row.dart';
import 'widgets/avatar_with_upload_btn.dart';

class SignUpPage extends StatefulHookConsumerWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// [Avatar]

              const AvatarWithUploadBtn(),

              /// [Form Fields]
              kGapSpaceXXL,
              const InputBox(
                hintText: 'Name',
                prefixAssetPath: AssetConst.userIcon,
              ),
              kGapSpaceL,
              const InputBox(
                hintText: 'Email',
                prefixAssetPath: AssetConst.mailIcon,
              ),
              kGapSpaceL,
              const PasswordInputBox(
                hintText: 'Password',
                prefixAssetPath: AssetConst.passwordIcon,
              ),
              kGapSpaceL,
              const PasswordInputBox(
                hintText: 'Confirm Password',
                prefixAssetPath: AssetConst.passwordIcon,
              ),

              /// [Sign Up Button]
              kGapSpaceXL,
              FlatBtn(
                onTap: () {},
                height: 65,
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
              const SocialLoginBtnRow(),

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
}
