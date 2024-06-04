import 'package:dokan/core/ui_helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/palette.dart';
import '../../../core/ui_helper/space_helper.dart';
import '../../../data/services/shared_pref_services.dart';
import '../../layout/app_root.dart';

class SignOutBtn extends ConsumerWidget {
  const SignOutBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        await SharedPrefServices.removeToken();
        ref.invalidate(userTokenProvider);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Palette.errorColor.withAlpha(200),
          borderRadius: BorderRadius.circular(8),
          boxShadow: Palette.primaryDropShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.logout,
              color: Palette.onPrimaryColor,
            ),
            kGapSpaceS,
            // Logout
            Text(
              'Sign Out',
              style: context.textTheme.labelLarge!.copyWith(
                color: Palette.onPrimaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
