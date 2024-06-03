// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:dokan/core/const/asset_const.dart';
import 'package:dokan/core/theme/palette.dart';
import 'package:dokan/core/ui_helper/space_helper.dart';

import '../../../core/ui_helper/ui_helper.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: Palette.primaryDropShadow,
      ),
      child: Row(
        children: [
          // Filter Icon and text

          Row(
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
              await showFilterSheet(context, 0);
              // if (res != null && res != selectedInitialSortValue.value) {
              //   selectedInitialSortValue.value = res;
              //   // invalidateProvider(ref);
              // }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sort by',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Palette.lightFontColor,
                      ),
                ),
                const Icon(
                  EvaIcons.chevron_down_outline,
                  color: Palette.lightFontColor,
                )
              ],
            ),
          )

          // another icon idk why
        ],
      ),
    );
  }
}

Future<int?> showFilterSheet(BuildContext context, int initialSortValue) async {
  final res = await showModalBottomSheet<int>(
    context: context,
    barrierColor: Colors.black.withOpacity(0.85),
    backgroundColor: Colors.transparent,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (BuildContext context) {
      return ProductFilterBottomSheet(
        initialSortValue: initialSortValue,
      );
    },
  );
  if (res != null) {
    return res;
  } else {
    return null;
  }
}

class ProductFilterBottomSheet extends HookConsumerWidget {
  const ProductFilterBottomSheet({
    super.key,
    required this.initialSortValue,
  });
  final int initialSortValue;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = getColorScheme(context);
    final textTheme = getTextTheme(context);
    final selectedSortValue = useState<int>(initialSortValue);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sort by',
            style: textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          ...List.generate(CosSortFilterPreset.getSortData().length, (index) {
            return ListTile(
              onTap: () {
                selectedSortValue.value = CosSortFilterPreset.getSortData()[index].value;
                Navigator.pop(context, CosSortFilterPreset.getSortData()[index].value);
              },
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                CosSortFilterPreset.getSortData()[index].title,
                style: textTheme.labelLarge!.copyWith(
                  color: selectedSortValue.value == CosSortFilterPreset.getSortData()[index].value
                      ? Palette.primaryColor
                      : Colors.black45,
                ),
              ),
              trailing: Radio(
                value: CosSortFilterPreset.getSortData()[index].value,
                groupValue: selectedSortValue.value,
                onChanged: (value) {
                  selectedSortValue.value = CosSortFilterPreset.getSortData()[index].value;
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

class CosSortFilterPreset {
  final String title;
  final int value;

  CosSortFilterPreset({required this.title, required this.value});

  static List<CosSortFilterPreset> getSortData() {
    return [
      CosSortFilterPreset(title: "Newest", value: 0),
      CosSortFilterPreset(title: "Oldest", value: 1),
      CosSortFilterPreset(title: "Price Low > High", value: 2),
      CosSortFilterPreset(title: "Price High > Low", value: 3),
      CosSortFilterPreset(title: "Best selling", value: 4),
    ];
  }

  @override
  bool operator ==(covariant CosSortFilterPreset other) {
    if (identical(this, other)) return true;

    return other.title == title && other.value == value;
  }

  @override
  int get hashCode => title.hashCode ^ value.hashCode;
}
