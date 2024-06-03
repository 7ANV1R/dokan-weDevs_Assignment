import 'package:flutter/material.dart';

import '../../core/ui_helper/ui_helper.dart';

class Unimplemented extends StatelessWidget {
  const Unimplemented({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '🚧',
          style: context.textTheme.headlineLarge,
        ),
      ),
    );
  }
}
