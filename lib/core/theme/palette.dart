import 'package:flutter/material.dart' show Alignment, BoxShadow, Color, Gradient, LinearGradient, Offset;

class Palette {
  static const primaryColor = Color(0xFFF75F55);
  static const onPrimaryColor = Color(0xFFFFFFFF);
  static const secondaryColor = Color(0xFF1ABC9C);
  static const onsecondaryColor = Color(0xFFFFFFFF);
  static const tertiaryColor = Color(0xFFFF679B);
  static const scaffoldBgColor = Color(0xFFF8F8F8);
  static const primaryShadowColor = Color(0xFF395AB8);

  // font colors
  static const lightFontColor = Color(0xFFA4A9AF);
  static const lightGreyFontColor = Color(0xFFDEE0E2);
  static const regularFontColor = Color(0xFF383C40);

  // error colors
  static const errorColor = Color(0xFFD32F2F);
  static const errorBgColor = Color(0xFFF7D0D0);
  // success colors
  static const successColor = Color(0xFF388E3C);
  static const successBgColor = Color(0xFFD8F8DA);

  static List<BoxShadow>? primaryDropShadow = [
    BoxShadow(
      color: Palette.primaryShadowColor.withOpacity(0.1),
      offset: const Offset(0, 3),
      blurRadius: 4,
    ),
  ];

  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFF9472),
      Color(0xFFF2709C),
    ],
  );
  static const Gradient reversePrimaryGradient = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [
      Color(0xFFFF9472),
      Color(0xFFF2709C),
    ],
  );
}
