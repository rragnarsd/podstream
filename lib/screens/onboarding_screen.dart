import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/local_data/onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    final page = onboardingData[_activePage];
    final size = MediaQuery.sizeOf(context);

    return Container(
      color: Colors.redAccent,
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: carouselController,
            items:
                onboardingData
                    .map((item) => Image.asset(item.image, fit: BoxFit.cover))
                    .toList(),
            options: CarouselOptions(
              height: size.height,
              aspectRatio: 1,
              viewportFraction: 1,
              scrollPhysics: const BouncingScrollPhysics(),
              enlargeCenterPage: true,
              onPageChanged: (index, _) => setState(() => _activePage = index),
            ),
          ),
          OnboardingInfo(
            page: page,
            carouselController: carouselController,
            activePage: _activePage,
            onSkip: _handleSkip,
            onNext: _handleNext,
          ),
        ],
      ),
    );
  }

  void _handleSkip() => context.pushReplacement('/interest-screen');

  void _handleNext() {
    if (_activePage == onboardingData.length - 1) {
      context.pushReplacement('/interest-screen');
    } else {
      carouselController.animateToPage(_activePage + 1);
    }
  }
}

class OnboardingInfo extends StatelessWidget {
  const OnboardingInfo({
    super.key,
    required this.page,
    required this.carouselController,
    required this.activePage,
    required this.onSkip,
    required this.onNext,
  });

  final OnboardingData page;
  final CarouselSliderController carouselController;
  final int activePage;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isLastPage = activePage == onboardingData.length - 1;

    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width,
        height: 360,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              SizedBox(
                child:
                    !isLastPage
                        ? Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: onSkip,
                            child: Text(
                              'Skip',
                              style: TextStyle(color: Colors.grey.shade400),
                            ),
                          ),
                        )
                        : Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: onSkip,
                            child: const SizedBox.shrink(),
                          ),
                        ),
              ),
              const SizedBox(height: 8),
              Text(
                page.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  page.description,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              OnboardingDots(
                carouselController: carouselController,
                activePage: activePage,
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 22,
                  ),
                  iconAlignment: IconAlignment.end,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: isLastPage ? onSkip : onNext,
                  label: Text(
                    isLastPage ? 'Get Started' : 'Next',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingDots extends StatelessWidget {
  const OnboardingDots({
    super.key,
    required this.carouselController,
    required this.activePage,
  });

  final CarouselSliderController carouselController;
  final int activePage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(onboardingData.length, (index) {
        final isActive = activePage == index;
        return GestureDetector(
          onTap: () => carouselController.animateToPage(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: isActive ? 56 : 18,
            height: 12.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              color: isActive ? Colors.redAccent : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }),
    );
  }
}
