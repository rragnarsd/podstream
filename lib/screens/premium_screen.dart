import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/utils/pod_assets.dart';
import 'package:podstream/widgets/spacers.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          color: Colors.black,
          onPressed: () => context.pop(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 4, left: 16, right: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                AppAssets.subscribeToPremium,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                AppAssets.enjoyPodcasts,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
      color: Colors.white,
      child: Column(
        children: [
          const AppSpacer(height: 24),
          Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          const AppSpacer(height: 16),
          Icon(
            isSelected ? Icons.check_circle : Icons.circle_outlined,
            size: 36,
            color: isSelected ? Colors.black : Colors.grey,
          ),
          const AppSpacer(height: 8),
          Text(
            price,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
            color: Colors.black,
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
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                  const AppSpacer(width: 8),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(
                        fontSize: 16,
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
