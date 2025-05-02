import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/utils/constants/pod_assets.dart';
import 'package:podstream/utils/constants/pod_colors.dart';
import 'package:podstream/utils/constants/pod_text_styles.dart';
import 'package:podstream/widgets/buttons.dart';
import 'package:podstream/widgets/spacers.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppAssets.subscribeToPremium,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        leading: AppIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          iconSize: 20,
          iconColor: const Color(0xFF2D2D2D),
          onPressed: () => context.pop(),
          backgroundColor: PodColors.transparentColor,
          borderColor: PodColors.transparentColor,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  SubscriptionCard(
                    title: AppAssets.starter,
                    price: AppAssets.starterPrice,
                    features: premiumFeatures,
                    isSelected: true,
                  ),
                  const AppSpacer(height: 16),
                  SubscriptionCard(
                    title: AppAssets.professional,
                    price: AppAssets.professionalPrice,
                    features: professionalFeatures,
                    isSelected: false,
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: AppSpacer(height: 16)),
        ],
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
    required this.isSelected,
  });

  final String title;
  final String price;
  final List<String> features;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
          width: 3,
          color:
              isSelected
                  ? PodColors.tealColor
                  : PodColors.textColor.withValues(alpha: .2),
        ),
      ),
      color: PodColors.whiteColor,
      child: Column(
        children: [
          const AppSpacer(height: 24),
          Container(
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? PodColors.tealColor
                      : PodColors.textColor.withValues(alpha: .2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                title,
                style: PodTextStyles.textStyle.copyWith(
                  color:
                      isSelected ? PodColors.whiteColor : PodColors.textColor,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ),
          const AppSpacer(height: 8),
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(AppAssets.premiumTriangle),
          ),
          Text(price, style: PodTextStyles.header1),
          const Divider(
            indent: 16,
            endIndent: 16,
            color: Color(0xFF2D2D2D),
            thickness: 2,
          ),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 24,
                    color:
                        isSelected
                            ? PodColors.tealColor
                            : PodColors.textColor.withValues(alpha: .2),
                  ),
                  const AppSpacer(width: 8),
                  Expanded(
                    child: Text(
                      feature,
                      style: PodTextStyles.bodyLarge.copyWith(
                        fontWeight:
                            feature == '+ ${AppAssets.everythingInStarter}'
                                ? FontWeight.bold
                                : FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const AppSpacer(height: 16),
        ],
      ),
    );
  }
}

List<String> premiumFeatures = [
  AppAssets.unlimitedAccessToAllPodcasts,
  AppAssets.noAds,
  AppAssets.highQualityAudio,
  AppAssets.downloadPodcastsForOfflineListening,
  AppAssets.funStickersAndRewards,
];

List<String> professionalFeatures = [
  AppAssets.earlyAccessToNewEpisodes,
  AppAssets.exclusiveContentAndInterviews,
  AppAssets.customPlaylistsAndRecommendations,
  AppAssets.priorityCustomerSupport,
  AppAssets.learningProgressTracking,
  '+ ${AppAssets.everythingInStarter}',
];
