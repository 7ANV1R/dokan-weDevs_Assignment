import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/const/asset_const.dart';
import '../core/theme/palette.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });

  final String imageUrl;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        padding: const EdgeInsets.all(40),
        color: Palette.successBgColor.withAlpha(100),
        child: RepaintBoundary(
          child: FittedBox(
            child: Image.asset(
              AssetConst.dokanIcon,
              height: 30,
              width: 30,
              color: Colors.grey,
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .shimmer(
                  duration: const Duration(milliseconds: 1300),
                ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        padding: const EdgeInsets.all(40),
        color: Palette.errorBgColor.withAlpha(100),
        child: FittedBox(
          child: Image.asset(
            AssetConst.dokanIcon,
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }
}
