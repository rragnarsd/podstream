import 'package:flutter/material.dart';
import 'package:podstream/screens/subscribe_screen.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose your interests'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Skip', style: TextStyle(color: Colors.grey.shade400)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Choose your interest and get the best podcast for you. You can choose multiple interests.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 4,
              children:
                  interests
                      .map((interest) => Chip(label: Text(interest)))
                      .toList(),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SubscribeScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

List<String> interests = [
  'Technology',
  'Science',
  'Business',
  'Health',
  'Education',
  'Politics',
  'History',
  'Art',
  'Music',
  'Sports',
  'Travel',
  'Food',
  'Fashion',
  'Lifestyle',
  'Entertainment',
  'News',
  'Gaming',
  'True Crime',
  'Comedy',
  'Technology',
  'Science',
  'Business',
  'Health',
];
