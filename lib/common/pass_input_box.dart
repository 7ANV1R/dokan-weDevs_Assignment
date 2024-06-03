import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../core/theme/palette.dart';

class PasswordInputBox extends HookWidget {
  const PasswordInputBox({
    super.key,
    this.controller,
    required this.hintText,
    required this.prefixAssetPath,
  });

  final TextEditingController? controller;
  final String hintText, prefixAssetPath;

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(false);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: Palette.primaryDropShadow,
      ),
      child: TextFormField(
        obscureText: !isPasswordVisible.value,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Palette.lightFontColor,
          ),
          contentPadding: const EdgeInsets.all(24),
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
          border: InputBorder.none,
        ),
      ),
    );
  }
}
