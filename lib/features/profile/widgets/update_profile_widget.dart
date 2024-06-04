import 'package:dokan/core/theme/palette.dart';
import 'package:dokan/core/ui_helper/space_helper.dart';
import 'package:dokan/core/ui_helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateProfileWidget extends HookConsumerWidget {
  const UpdateProfileWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameController = useTextEditingController(text: 'First Name');
    final lastNameController = useTextEditingController(text: "N/A");
    return Column(
      children: [
        kGapSpaceL,
        UpdateProfileTextField(
          title: "First Name",
          controller: firstNameController,
        ),
        kGapSpaceM,
        UpdateProfileTextField(
          title: "Last Name",
          controller: lastNameController,
        ),
      ],
    );
  }
}

class UpdateProfileTextField extends StatelessWidget {
  const UpdateProfileTextField({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.bodyLarge!.copyWith(
            color: Palette.lightFontColor,
          ),
        ),
        kGapSpaceXS,
        TextFormField(
          controller: controller,
          style: context.textTheme.bodyLarge!.copyWith(
            color: Palette.lightFontColor,
          ),
          decoration: InputDecoration(
            hintText: title,
            isDense: true,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Palette.lightGreyFontColor),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Palette.successColor),
            ),
          ),
        ),
      ],
    );
  }
}
