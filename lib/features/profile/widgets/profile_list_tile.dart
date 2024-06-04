import 'package:flutter/material.dart';

import '../../../core/const/asset_const.dart';
import '../../../core/theme/palette.dart';
import 'expandable_tile.dart';
import 'update_profile_widget.dart';

class ProfileSettingsTile extends StatelessWidget {
  const ProfileSettingsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: Palette.primaryDropShadow,
      ),
      child: const Column(
        children: [
          ExpandableTile(
            title: "Account",
            iconPath: AssetConst.userIcon,
            child: Column(
              children: [
                UpdateProfileWidget(),
              ],
            ),
          ),
          Divider(
            color: Palette.lightGreyFontColor,
          ),
          ExpandableTile(
            title: "Password",
            iconPath: AssetConst.passwordIcon,
          ),
          Divider(
            color: Palette.lightGreyFontColor,
          ),
          ExpandableTile(
            title: "Notification",
            iconPath: AssetConst.bellIcon,
          ),
          Divider(
            color: Palette.lightGreyFontColor,
          ),
          ExpandableTile(
            title: "Wishlist",
            iconPath: AssetConst.heartIcon,
          ),
        ],
      ),
    );
  }
}
