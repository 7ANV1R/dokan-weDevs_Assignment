import 'package:flutter/material.dart';

import '../core/ui_helper/ui_helper.dart';
import 'loader.dart';

class FlatBtn extends StatelessWidget {
  final VoidCallback onTap;
  final Widget label;
  final Color? backgroundColor;
  final bool enableBoxShadow;
  final Color? iconColor;
  final double height, width, radius;
  final bool? isLoading;
  final bool borderOnly;

  const FlatBtn({
    super.key,
    required this.onTap,
    required this.label,
    this.backgroundColor,
    this.enableBoxShadow = false,
    this.iconColor,
    this.height = 50,
    this.width = 50,
    this.radius = 10,
    this.isLoading,
    this.borderOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: enableBoxShadow
            ? [
                BoxShadow(
                  color: backgroundColor?.withOpacity(0.3) ?? scheme.shadow.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: const Offset(0, 6), // changes position of shadow
                ),
              ]
            : [],
        borderRadius: BorderRadius.circular(radius),
        border: borderOnly
            ? Border.all(
                color: backgroundColor ?? scheme.surface,
                width: 1,
              )
            : null,
        color: borderOnly ? Colors.transparent : backgroundColor ?? scheme.surface,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(radius),
        color: borderOnly ? Colors.transparent : backgroundColor ?? scheme.surface,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
          splashColor: scheme.outlineVariant.withOpacity(0.3),
          splashFactory: InkSplash.splashFactory,
          child: Center(
            // child: label,
            child: isLoading != null && isLoading!
                ? SecondaryLoader(
                    color: borderOnly ? backgroundColor : scheme.onPrimary,
                    size: 18,
                  )
                : label,
          ),
        ),
      ),
    );
  }
}
