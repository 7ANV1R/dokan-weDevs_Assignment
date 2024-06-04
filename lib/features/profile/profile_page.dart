import 'package:dokan/core/ui_helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/ui_helper/space_helper.dart';
import 'widgets/profile_list_tile.dart';
import 'widgets/sign_out_btn.dart';
import 'widgets/user_avatar.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
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
              'John Smith',
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'info@jhonsmith.com',
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            kGapSpaceXXL,
            const ProfileSettingsTile(),
            kGapSpaceL,
            const SignOutBtn(),
          ],
        ),
      ),
    );
  }
}
