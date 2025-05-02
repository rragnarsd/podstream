import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/local_data/interest_data.dart';
import 'package:podstream/utils/constants/pod_assets.dart';
import 'package:podstream/utils/constants/pod_colors.dart';
import 'package:podstream/utils/constants/pod_text_styles.dart';
import 'package:podstream/utils/shared_prefs.dart';
import 'package:podstream/widgets/buttons.dart';
import 'package:podstream/widgets/spacers.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<InterestData> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AppAssets.logo),
        leadingWidth: 100,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              AppAssets.chooseYourInterestsDescription,
              style: PodTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const AppSpacer(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 6,
            children:
                interests
                    .map(
                      (interest) => GestureDetector(
                        onTap: () => toggleInterest(interest),
                        child: Chip(
                          label: Text(
                            interest.interest,
                            style: PodTextStyles.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color:
                                  selectedInterests.contains(interest)
                                      ? interest.textColor
                                      : PodColors.textColor,
                            ),
                          ),
                          side: const BorderSide(width: 3),
                          backgroundColor:
                              selectedInterests.contains(interest)
                                  ? interest.color
                                  : PodColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
          const Spacer(),
          const OnboardingButtonBar(
            continueText: AppAssets.continueText,
            routePath: '/onboarding/subscribe',
          ),
          const AppSpacer(height: 24),
        ],
      ),
    );
  }

  void toggleInterest(InterestData interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }
}

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
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: AppOutlinedButton(
                onPressed: () async {
                  await SharedPrefs.setOnboardingSeen();
                  if (!context.mounted) return;
                  context.pushReplacement('/onboarding/interests');
                },
                title: AppAssets.skipText,
              ),
            ),
          ),
          const AppSpacer(width: 12),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: AppOutlinedButton(
                onPressed: () => context.push(routePath),
                backgroundColor: PodColors.tealColor,
                textColor: PodColors.whiteColor,
                title: continueText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
