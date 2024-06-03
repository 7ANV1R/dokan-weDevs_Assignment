import 'package:flutter/material.dart';

import '../../../common/app_network_img.dart';
import '../../../core/const/asset_const.dart';
import '../../../core/theme/palette.dart';
import '../../../core/ui_helper/space_helper.dart';
import '../../../core/ui_helper/ui_helper.dart';
import '../../../data/model/product/product_model.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.item,
  });

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: Palette.primaryDropShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Product Image
          if (item.images.isNotEmpty) ...[
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              child: SizedBox(
                height: 200,
                child: AppNetworkImage(
                  imageUrl: item.images.first.src,
                  height: 200,
                ),
              ),
            ),
          ] else ...[
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              child: Container(
                color: Colors.grey[200],
                child: Image.asset(
                  AssetConst.dokanIcon,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          kGapSpaceM,
          // Product Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              item.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // old price and regular price rich text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: RichText(
              text: TextSpan(
                children: [
                  // if regular price is not empty or regular price and price is same
                  // then only show price
                  // other wise show both regular price and price
                  // regular price will be strike through
                  if (item.regularPrice.isNotEmpty && item.regularPrice != item.price) ...[
                    TextSpan(
                      text: "\$${item.regularPrice}",
                      style: context.textTheme.bodyLarge!.copyWith(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 8)),
                  ],
                  TextSpan(
                    text: "\$${item.price}",
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // rating and review count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                // rating star row
                generateStarRow(item.avgRating),
                Text(
                  '(${item.ratingCount})',
                  style: context.textTheme.bodySmall!.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          kGapSpaceS,
        ],
      ),
    );
  }

  Widget generateStarRow(String averageRating) {
    final double rating = double.parse(averageRating);
    final int fullStar = rating.floor();
    final bool halfStar = rating - fullStar >= 0.5;
    final int emptyStar = 5 - fullStar - (halfStar ? 1 : 0);

    return Row(
      children: [
        for (int i = 0; i < fullStar; i++)
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 16,
          ),
        if (halfStar)
          const Icon(
            Icons.star_half,
            color: Colors.amber,
            size: 16,
          ),
        for (int i = 0; i < emptyStar; i++)
          const Icon(
            Icons.star_border,
            color: Colors.amber,
            size: 16,
          ),
      ],
    );
  }
}
