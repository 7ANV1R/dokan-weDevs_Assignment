import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/flat_btn.dart';
import '../../../core/theme/palette.dart';
import '../../../core/ui_helper/space_helper.dart';
import '../../../core/ui_helper/ui_helper.dart';
import '../../../data/api/profile_api.dart';
import '../../../data/model/profile/user_profile.dart';
import '../controller/profile_controller.dart';

class UpdateProfileWidget extends HookConsumerWidget {
  const UpdateProfileWidget({super.key, required this.profile});
  final UserProfile profile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final firstNameController = useTextEditingController(text: profile.firstName);
    final lastNameController = useTextEditingController(text: profile.lastName);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        kGapSpaceL,
        Row(
          children: [
            Expanded(
              child: FlatBtn(
                onTap: () {
                  // reset text if text is not same as profile
                  if (firstNameController.text != profile.firstName ||
                      lastNameController.text != profile.lastName) {
                    firstNameController.text = profile.firstName;
                    lastNameController.text = profile.lastName;
                  }
                },
                backgroundColor: Palette.lightFontColor,
                borderOnly: true,
                label: Text(
                  'Cancel',
                  style: context.textTheme.labelLarge!.copyWith(
                    color: Palette.lightFontColor,
                  ),
                ),
              ),
            ),
            kGapSpaceM,
            Expanded(
              child: FlatBtn(
                onTap: () async {
                  if (firstNameController.text != profile.firstName ||
                      lastNameController.text != profile.lastName) {
                    isLoading.value = true;
                    await _updateProfile(
                      firstName: firstNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      ref: ref,
                      context: context,
                    );
                    isLoading.value = false;
                  }
                },
                backgroundColor: Palette.secondaryColor,
                isLoading: isLoading.value,
                label: Text(
                  'Update Profile',
                  style: context.textTheme.labelLarge!.copyWith(
                    color: Palette.onsecondaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _updateProfile({
    required String firstName,
    required String lastName,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    // update profile
    final res = await ref.read(profileAPIProvider).updateProfile(
          firstName: firstName,
          lastName: lastName,
        );
    res.fold((l) {
      // show error
      showErrorSnackbar(
        context: context,
        message: l.message,
      );
    }, (r) {
      // show success
      showSuccessSnackbar(
        context: context,
        message: 'Profile Updated',
      );
      ref.invalidate(profileDataProvider);
    });
  }
}

class UpdateProfileTextField extends HookWidget {
  const UpdateProfileTextField({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final initialValue = controller.text;
    final textHasChanged = useState(false);
    // listen controller value then
    // if controller value changed then update isChanged true
    useEffect(() {
      void listener() {
        if (controller.text != initialValue) {
          textHasChanged.value = true;
        } else {
          textHasChanged.value = false;
        }
      }

      controller.addListener(listener);
      return () {
        controller.removeListener(listener);
      };
    }, [controller.text]);

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
            color: textHasChanged.value ? Palette.regularFontColor : Palette.lightFontColor,
          ),
          decoration: InputDecoration(
            hintText: controller.text.isEmpty ? 'N/A' : null,
            hintStyle: context.textTheme.bodyLarge!.copyWith(
              color: Palette.lightFontColor,
            ),
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
