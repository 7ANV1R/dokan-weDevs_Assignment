import '../../../core/const/asset_const.dart';
import '../../../core/theme/palette.dart';
import '../../../core/ui_helper/space_helper.dart';
import '../../../core/ui_helper/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExpandableTile extends HookWidget {
  const ExpandableTile({
    super.key,
    required this.title,
    required this.iconPath,
    this.child,
  });

  final String title, iconPath;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);
    return GestureDetector(
      onTap: () {
        isExpanded.value = !isExpanded.value;
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        duration: const Duration(milliseconds: 300),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  iconPath,
                  width: 20,
                  height: 20,
                ),
                kGapSpaceM,
                Text(
                  title,
                  style: context.textTheme.bodyLarge,
                ),
                const Spacer(),

                // animated icon
                RepaintBoundary(
                  child: Image.asset(
                    AssetConst.downIcon,
                    width: 20,
                    height: 20,
                    color: Palette.regularFontColor,
                  )
                      .animate(
                        target: isExpanded.value ? 1 : 0,
                      )
                      .rotate(
                        begin: -0.25,
                        end: 0.0,
                      ),
                ),
              ],
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: isExpanded.value ? child : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
