import 'package:flutter/material.dart' show Colors, CrossAxisAlignment, Icon, Icons, Row;

Row generateStarRow(String averageRating) {
  final double rating = double.parse(averageRating);
  final int fullStar = rating.floor();
  final bool halfStar = rating - fullStar >= 0.5;
  final int emptyStar = 5 - fullStar - (halfStar ? 1 : 0);

  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
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
