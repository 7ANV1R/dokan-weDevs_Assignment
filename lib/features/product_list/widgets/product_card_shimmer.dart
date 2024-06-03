import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/ui_helper/space_helper.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 16,
                    width: double.infinity,
                    color: Colors.grey.shade400,
                  ),
                  kGapSpaceS,
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 16,
                    color: Colors.grey.shade400,
                  ),
                ],
              )),
        ],
      )
          .animate(
            onPlay: (controller) => controller.repeat(),
          )
          .shimmer(
            duration: const Duration(seconds: 2),
          ),
    );
  }
}
