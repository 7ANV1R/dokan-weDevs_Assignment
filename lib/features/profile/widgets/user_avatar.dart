import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../core/const/asset_const.dart';
import '../../../core/theme/palette.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DottedBorder(
        color: Palette.tertiaryColor,
        strokeWidth: 1,
        dashPattern: const [4, 4],
        padding: const EdgeInsets.all(8),
        borderType: BorderType.Circle,
        child: Container(
          height: 120,
          width: 120,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              // asset image
              image: AssetImage(AssetConst.avatar),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
