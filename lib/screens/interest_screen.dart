import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/local_data/interest_data.dart';
import 'package:podstream/screens/subscribe_screen.dart';
import 'package:podstream/utils/pod_assets.dart';
import 'package:podstream/widgets/spacers.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<InterestData> selectedInterests = [];

  void toggleInterest(InterestData interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppAssets.chooseYourInterests,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              AppAssets.chooseYourInterestsDescription,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color:
                                    selectedInterests.contains(interest)
                                        ? interest.textColor
                                        : Colors.black,
                              ),
                            ),
                            side: const BorderSide(width: 3),
                            backgroundColor:
                                selectedInterests.contains(interest)
                                    ? interest.color
                                    : Colors.white,
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
              continueWidget: SubscribeScreen(),
            ),
            const AppSpacer(height: 24),
          ],
        ),
      ),
    );
  }
}

class OnboardingButtonBar extends StatelessWidget {
  const OnboardingButtonBar({
    super.key,

    required this.continueText,
    required this.continueWidget,
  });

  final String continueText;
  final Widget continueWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 3),
              ),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  AppAssets.skipText,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ),
          const AppSpacer(width: 12),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 3),
              ),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),

                onPressed: () => context.push(continueWidget.toString()),
                child: Text(
                  continueText,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
