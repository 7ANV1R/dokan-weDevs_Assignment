import 'package:dokan/common/flat_btn.dart';
import 'package:dokan/core/const/asset_const.dart';
import 'package:dokan/core/theme/palette.dart';
import 'package:dokan/core/ui_helper/space_helper.dart';
import 'package:dokan/core/ui_helper/ui_helper.dart';
import 'package:flutter/material.dart';

import '../../../common/input_box.dart';
import '../../../common/pass_input_box.dart';
import '../widgets/social_login_btn_row.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Form(
            // TODO: Implement the form key
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

                /// [Form Fields]
                kGapSpaceXXXL,
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
                GestureDetector(
                  onTap: () {
                    showColoredSnackBar(
                        context: context, msg: "Can't remember your password? Unlucky TBH 💀");
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
                  onTap: () {},
                  height: 65,
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
                  onPressed: () {},
                  child: Text(
                    'Create New Account',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: Palette.regularFontColor,
                      fontWeight: FontWeight.w300,
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
}
