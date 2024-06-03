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
  static const regularFontColor = Color(0xFF383C40);

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
}
