import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/theme/palette.dart';
import '../../../core/ui_helper/space_helper.dart';
import '../../../core/ui_helper/ui_helper.dart';

class ProfileShimmerUI extends StatelessWidget {
  const ProfileShimmerUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Text(
            'My Account',
            style: context.textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          kGapSpaceXL,
          Center(
            child: DottedBorder(
              color: Palette.lightFontColor,
              strokeWidth: 1,
              dashPattern: const [4, 4],
              padding: const EdgeInsets.all(8),
              borderType: BorderType.Circle,
              child: RepaintBoundary(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
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
          kGapSpaceL,
          RepaintBoundary(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 24,
                    width: 150,
                    color: Colors.grey.shade300,
                  ),
                ),
                kGapSpaceS,
                Center(
                  child: Container(
                    height: 18,
                    width: 200,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .shimmer(
                  duration: const Duration(milliseconds: 1300),
                ),
          ),
          kGapSpaceL,
          Container(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(28),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: RepaintBoundary(
              child: Column(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      bottom: index == 4 ? 0 : 16,
                    ),
                    child: Row(
                      children: [
                        // Icon shimmer
                        Container(
                          height: 32,
                          width: 32,
                          color: Colors.grey.shade300,
                        ),

                        // Titile shimmer
                        kGapSpaceL,
                        Expanded(
                          child: Container(
                            height: 32,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .shimmer(
                    duration: const Duration(milliseconds: 1300),
                  ),
            ),
          )
        ],
      ),
    );
  }
}
