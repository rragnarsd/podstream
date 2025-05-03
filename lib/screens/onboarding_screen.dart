import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/local_data/onboarding_data.dart';
import 'package:podstream/utils/constants/pod_assets.dart';
import 'package:podstream/utils/constants/pod_colors.dart';
import 'package:podstream/utils/constants/pod_text_styles.dart';
import 'package:podstream/utils/shared_prefs.dart';
import 'package:podstream/widgets/buttons.dart';
import 'package:podstream/widgets/spacers.dart';

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

    return Scaffold(
      body: Container(
        color: PodColors.tealColor,
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
                onPageChanged:
                    (index, _) => setState(() => _activePage = index),
              ),
            ),
            _OnboardingInfo(
              page: page,
              carouselController: carouselController,
              activePage: _activePage,
              onSkip: _handleSkip,
              onNext: _handleNext,
            ),
          ],
        ),
      ),
    );
  }

  void _handleSkip() async {
    await SharedPrefs.setOnboardingSeen();
    if (mounted) {
      context.go('/onboarding/interests');
    }
  }

  void _handleNext() async {
    if (_activePage == onboardingData.length - 1) {
      await SharedPrefs.setOnboardingSeen();
      if (mounted) {
        context.go('/onboarding/interests');
      }
    } else {
      carouselController.animateToPage(_activePage + 1);
    }
  }
}

class _OnboardingInfo extends StatelessWidget {
  const _OnboardingInfo({
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
        height: 340,
        decoration: const BoxDecoration(
          color: PodColors.whiteColor,
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
                          child: AppTextButton(
                            onPressed: onSkip,
                            child: Text(
                              AppAssets.skipText,
                              style: PodTextStyles.textStyle.copyWith(
                                color: PodColors.textColor.withValues(
                                  alpha: 0.5,
                                ),
                              ),
                            ),
                          ),
                        )
                        : Align(
                          alignment: Alignment.topRight,
                          child: AppTextButton(
                            onPressed: onSkip,
                            child: const SizedBox.shrink(),
                          ),
                        ),
              ),
              const AppSpacer(height: 8),
              Text(page.title, style: PodTextStyles.header1),
              const AppSpacer(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  page.description,
                  style: PodTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const AppSpacer(height: 24),
              _OnboardingDots(
                carouselController: carouselController,
                activePage: activePage,
              ),
              const AppSpacer(height: 36),
              SizedBox(
                width: double.infinity,
                child: AppIconElevatedButton(
                  onPressed: isLastPage ? onSkip : onNext,
                  title: isLastPage ? AppAssets.getStarted : AppAssets.next,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingDots extends StatelessWidget {
  const _OnboardingDots({
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
              color:
                  isActive
                      ? PodColors.tealColor
                      : PodColors.textColor.withValues(alpha: .2),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }),
    );
  }
}
