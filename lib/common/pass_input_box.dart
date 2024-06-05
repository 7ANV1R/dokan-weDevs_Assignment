import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../core/theme/palette.dart';

class PasswordInputBox extends HookWidget {
  const PasswordInputBox({
    super.key,
    this.controller,
    required this.hintText,
    required this.prefixAssetPath,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final String hintText, prefixAssetPath;

  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged, onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(false);
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: Palette.primaryDropShadow,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: !isPasswordVisible.value,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          hintStyle: const TextStyle(
            color: Palette.lightFontColor,
          ),
          contentPadding: const EdgeInsets.all(20),
          suffixIcon: GestureDetector(
            onTap: () {
              isPasswordVisible.value = !isPasswordVisible.value;
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                color: isPasswordVisible.value ? Palette.primaryColor : Palette.lightFontColor,
              ),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
              prefixAssetPath,
              width: 24,
              height: 24,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 24,
            minHeight: 24,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
