import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/theme/palette.dart';
import '../../../core/ui_helper/space_helper.dart';
import '../../../core/ui_helper/ui_helper.dart';

class SocialLoginBtnRow extends StatelessWidget {
  const SocialLoginBtnRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            showErrorSnackbar(
              context: context,
              message:
                  "Hey! Spending too much time on Facebook?\nActually we are lazy to implement facebook login for now. 🤦‍♂️",
            );
          },
          child: const SocialMediaIcon(
            assetName: Brands.facebook_f,
            color: Color(0xFF3B5998),
          ),
        ),
        kGapSpaceM,
        GestureDetector(
          onTap: () {
            showSuccessSnackbar(
              context: context,
              snackBarPosition: SnackBarPosition.bottom,
              message:
                  "Nahh! Forget Google, ChatGPT is the future.\nActually we are lazy to implement Google login for now. 🤦‍♂️",
            );
          },
          child: const SocialMediaIcon(
            assetName: Brands.google,
          ),
        ),
      ],
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    super.key,
    required this.assetName,
    this.color,
  });
  final String assetName;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: Palette.primaryDropShadow,
      ),
      child: Brand(
        assetName,
        colorFilter: color == null ? null : const ColorFilter.mode(Color(0xFF3B5998), BlendMode.srcIn),
      ),
    );
  }
}
