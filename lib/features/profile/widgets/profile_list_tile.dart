import 'package:flutter/material.dart';

import '../../../core/const/asset_const.dart';
import '../../../core/theme/palette.dart';
import '../../../data/model/profile/user_profile.dart';
import 'expandable_tile.dart';
import 'update_profile_widget.dart';

class ProfileSettingsTile extends StatelessWidget {
  const ProfileSettingsTile({
    super.key,
    required this.profile,
  });
  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: Palette.primaryDropShadow,
      ),
      child: Column(
        children: [
          ExpandableTile(
            title: "Account",
            iconPath: AssetConst.userIcon,
            child: Column(
              children: [
                UpdateProfileWidget(
                  profile: profile,
                ),
              ],
            ),
          ),
          const Divider(
            color: Palette.lightGreyFontColor,
          ),
          const ExpandableTile(
            title: "Password",
            iconPath: AssetConst.passwordIcon,
          ),
          const Divider(
            color: Palette.lightGreyFontColor,
          ),
          const ExpandableTile(
            title: "Notification",
            iconPath: AssetConst.bellIcon,
          ),
          const Divider(
            color: Palette.lightGreyFontColor,
          ),
          const ExpandableTile(
            title: "Wishlist",
            iconPath: AssetConst.heartIcon,
          ),
        ],
      ),
    );
  }
}
