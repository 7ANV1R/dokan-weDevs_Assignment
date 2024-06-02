import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PrimaryLoader extends StatelessWidget {
  const PrimaryLoader({super.key, this.size = 12, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFoldingCube(
        color: color ?? Colors.white,
        size: size,
      ),
    );
  }
}

class SecondaryLoader extends StatelessWidget {
  const SecondaryLoader({super.key, this.size = 12, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWave(
        color: color ?? Colors.white,
        size: size,
      ),
    );
  }
}

class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PrimaryLoader(),
    );
  }
}
