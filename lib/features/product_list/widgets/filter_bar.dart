import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../core/const/asset_const.dart';
import '../../../core/theme/palette.dart';
import '../../../core/ui_helper/space_helper.dart';
import '../../../core/ui_helper/ui_helper.dart';
import '../product_list_page.dart';
import 'sort_by_bottom_sheet.dart';
import 'sort_preset.dart';

class FilterBar extends HookConsumerWidget {
  const FilterBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSortValue = ref.watch(sortIDProvider);
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: Palette.primaryDropShadow,
      ),
      child: Row(
        children: [
          // Filter Icon and text

          selectedSortValue != 0
              ? Expanded(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'List sorted by:\n',
                        style: context.textTheme.labelMedium!.copyWith(
                          color: Palette.lightFontColor,
                        ),
                      ),
                      TextSpan(
                        text: sortText(selectedSortValue),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Palette.lightFontColor,
                            ),
                      ),
                    ]),
                  ),
                )
              : Row(
                  children: [
                    Image.asset(
                      AssetConst.tuneIcon,
                      height: 20,
                      width: 20,
                      fit: BoxFit.cover,
                    ),
                    kGapSpaceM,
                    Text(
                      'Filter',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Palette.lightFontColor,
                          ),
                    ),
                  ],
                ),

          // space
          const Spacer(),

          // sort by text and icon
          GestureDetector(
            onTap: () async {
              // open sort by dialog
              final res = await showFilterSheet(context, selectedSortValue);
              if (res != null && res != selectedSortValue) {
                ref.read(sortIDProvider.notifier).update((state) => res);
              }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sort by',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: selectedSortValue != 0 ? Palette.successColor : Palette.lightFontColor,
                      ),
                ),
                Icon(
                  EvaIcons.chevron_down_outline,
                  color: selectedSortValue != 0 ? Palette.successColor : Palette.lightFontColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
