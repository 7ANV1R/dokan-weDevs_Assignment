import 'package:flutter/material.dart';

import '../../../core/ui_helper/space_helper.dart';
import '../../../core/ui_helper/ui_helper.dart';
import '../../../data/model/profile/user_profile.dart';
import 'profile_list_tile.dart';
import 'sign_out_btn.dart';
import 'user_avatar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
    required this.profile,
  });
  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // My Account
          Text(
            'My Account',
            style: context.textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          kGapSpaceXL,
          // Profile Image
          const UserAvatarWidget(),
          kGapSpaceL,
          Text(
            profile.name,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            profile.email,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          kGapSpaceXXL,
          ProfileSettingsTile(
            profile: profile,
          ),
          kGapSpaceL,
          const SignOutBtn(),
        ],
      ),
    );
  }
}
