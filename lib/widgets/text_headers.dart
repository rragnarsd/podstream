import 'package:flutter/material.dart';
import 'package:podstream/utils/constants/pod_text_styles.dart';

class SliverAppTextHeader extends StatelessWidget {
  const SliverAppTextHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Text(title, style: PodTextStyles.bodyXLarge),
      ),
    );
  }
}

class AppTextHeader extends StatelessWidget {
  const AppTextHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(title, style: PodTextStyles.bodyXLarge),
    );
  }
}
