import 'package:flutter/material.dart';
import 'package:podstream/screens/subscribe_screen.dart';

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
      appBar: AppBar(title: const Text('Choose your interests')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Choose your interest and get the best podcast for you. You can choose multiple interests.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 24),
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
              continueText: 'Continue',
              continueWidget: SubscribeScreen(),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

List<InterestData> interests = [
  InterestData(
    interest: 'Technology',
    isSelected: false,
    color: Colors.blue,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Science',
    isSelected: false,
    color: Colors.green,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Business',
    isSelected: false,
    color: Colors.purple,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Health',
    isSelected: false,
    color: Colors.red,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Education',
    isSelected: false,
    color: Colors.orange,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Politics',
    isSelected: false,
    color: Colors.indigo,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'History',
    isSelected: false,
    color: Colors.brown,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Art',
    isSelected: false,
    color: Colors.pink,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Music',
    isSelected: false,
    color: Colors.teal,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Sports',
    isSelected: false,
    color: Colors.amber,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Travel',
    isSelected: false,
    color: Colors.cyan,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Food',
    isSelected: false,
    color: Colors.deepOrange,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Fashion',
    isSelected: false,
    color: Colors.deepPurple,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Lifestyle',
    isSelected: false,
    color: Colors.lightBlue,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Entertainment',
    isSelected: false,
    color: Colors.lightGreen,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'News',
    isSelected: false,
    color: Colors.lime,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'Gaming',
    isSelected: false,
    color: Colors.yellow,
    textColor: Colors.black,
  ),
  InterestData(
    interest: 'True Crime',
    isSelected: false,
    color: Colors.redAccent,
    textColor: Colors.white,
  ),
  InterestData(
    interest: 'Comedy',
    isSelected: false,
    color: Colors.amberAccent,
    textColor: Colors.black,
  ),
];

class InterestData {
  final String interest;
  final bool isSelected;
  final Color color;
  final Color textColor;

  InterestData({
    required this.interest,
    required this.isSelected,
    required this.color,
    required this.textColor,
  });
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
                  'Skip',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => continueWidget),
                  );
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
