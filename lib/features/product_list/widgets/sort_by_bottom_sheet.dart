import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/palette.dart';
import '../../../core/ui_helper/ui_helper.dart';
import 'sort_preset.dart';

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
          ...List.generate(SortFilterPreset.getSortData().length, (index) {
            return ListTile(
              onTap: () {
                selectedSortValue.value = SortFilterPreset.getSortData()[index].value;
                Navigator.pop(context, SortFilterPreset.getSortData()[index].value);
              },
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                SortFilterPreset.getSortData()[index].title,
                style: textTheme.labelLarge!.copyWith(
                  color: selectedSortValue.value == SortFilterPreset.getSortData()[index].value
                      ? Palette.tertiaryColor
                      : Colors.black45,
                ),
              ),
              trailing: Radio(
                value: SortFilterPreset.getSortData()[index].value,
                groupValue: selectedSortValue.value,
                onChanged: (value) {
                  selectedSortValue.value = SortFilterPreset.getSortData()[index].value;
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
