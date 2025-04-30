import 'package:flutter/material.dart';

class SliverAppSpacer extends StatelessWidget {
  const SliverAppSpacer({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: height, width: width));
  }
}

class AppSpacer extends StatelessWidget {
  const AppSpacer({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
