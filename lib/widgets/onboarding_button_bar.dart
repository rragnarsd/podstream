import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/utils/pod_assets.dart';
import 'package:podstream/widgets/spacers.dart';

class OnboardingButtonBar extends StatelessWidget {
  const OnboardingButtonBar({
    super.key,
    required this.continueText,
    required this.routePath,
  });

  final String continueText;
  final String routePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(width: 3),
                  ),
                ),
                onPressed: () => context.pop(),
                child: const Text(
                  AppAssets.skipText,
                  style: TextStyle(color: Color(0xFF2D2D2D), fontSize: 16),
                ),
              ),
            ),
          ),
          const AppSpacer(width: 12),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(width: 3),
                  ),
                ),
                onPressed: () => context.push(routePath),
                child: Text(
                  continueText,
                  style: const TextStyle(
                    color: Color(0xFF2D2D2D),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
