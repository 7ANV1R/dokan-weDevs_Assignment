import 'package:dokan/core/theme/palette.dart';
import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: Palette.primaryDropShadow,
      ),
      child: TextFormField(
        controller: controller,
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
          hintStyle: const TextStyle(
            color: Palette.lightFontColor,
          ),
          contentPadding: const EdgeInsets.all(24),
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
