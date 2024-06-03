import 'package:flutter/material.dart';

import '../../../../core/const/asset_const.dart';
import '../../../../core/theme/palette.dart';

class AvatarWithUploadBtn extends StatelessWidget {
  const AvatarWithUploadBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double avatarRadius = 65.0;
    return Align(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: avatarRadius * 2,
            width: avatarRadius * 2,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: Palette.primaryDropShadow,
            ),
            child: Center(
              child: Image.asset(
                AssetConst.userIcon,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              width: avatarRadius / 1.7,
              height: avatarRadius / 1.7,
              decoration: const BoxDecoration(
                gradient: Palette.primaryGradient,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt,
                size: avatarRadius / 3.5,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
