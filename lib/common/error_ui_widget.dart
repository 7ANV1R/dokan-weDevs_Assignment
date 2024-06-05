import 'package:flutter/material.dart';

import '../core/const/asset_const.dart';
import '../core/theme/palette.dart';
import '../core/ui_helper/space_helper.dart';
import '../core/ui_helper/ui_helper.dart';

class ErrorUIWidget extends StatelessWidget {
  const ErrorUIWidget({
    super.key,
    this.message = 'Something went wrong!',
    this.onRetry,
  });
  final String? message;
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              AssetConst.errorGif,
              height: context.screenSize.width * 0.6,
              width: context.screenSize.width * 0.6,
              fit: BoxFit.cover,
            ),
          ),
          kGapSpaceS,
          Text(
            message!,
            style: context.textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w500,
              color: Palette.lightFontColor,
            ),
          ),

          // Retry Button
          Offstage(
            offstage: onRetry == null,
            child: TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ),
        ],
      ),
    );
  }
}
