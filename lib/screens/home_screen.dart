import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/local_data/subscribe_data.dart';
import 'package:podstream/local_data/trending_data.dart';
import 'package:podstream/utils/pod_assets.dart';
import 'package:podstream/widgets/spacers.dart';
import 'package:podstream/widgets/text_headers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Image.asset(AppAssets.logo),
        leadingWidth: 100,
      ),
      body: const CustomScrollView(
        slivers: [
          SliverAppSpacer(height: 12),
          _TrendingList(),
          _RecommendedList(),
          _RecentlyPlayedList(),
        ],
      ),
    );
  }
}

class _TrendingList extends StatefulWidget {
  const _TrendingList();

  @override
  State<_TrendingList> createState() => _TrendingListState();
}

class _TrendingListState extends State<_TrendingList> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppTextHeader(title: AppAssets.trendingPodcasts),
          const AppSpacer(height: 16),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendingPodcasts.length,
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                final podcast = trendingPodcasts[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 16 : 0,
                    right: 16,
                  ),
                  child: _TrendingItem(
                    title: podcast.title,
                    host: podcast.host,
                    duration: podcast.duration,
                    image: podcast.image,
                    backgroundColor: podcast.backgroundColor,
                  ),
                );
              },
            ),
          ),
          const AppSpacer(height: 32),
        ],
      ),
    );
  }
}

class _TrendingItem extends StatelessWidget {
  const _TrendingItem({
    required this.title,
    required this.host,
    required this.duration,
    required this.image,
    required this.backgroundColor,
  });

  final String title;
  final String host;
  final String duration;
  final String image;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 300,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D2D2D),
                ),
              ),
              const AppSpacer(height: 4),
              Text(
                host,
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFF2D2D2D).withValues(alpha: .6),
                ),
              ),
              const AppSpacer(height: 12),
              _PlayButton(duration: duration),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset(image, height: 200, fit: BoxFit.cover),
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({required this.duration});

  final String duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: .2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0xFF2D2D2D),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 16.0,
            ),
          ),
          const AppSpacer(width: 8),
          Text(
            duration,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D2D2D),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendedList extends StatelessWidget {
  const _RecommendedList();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppTextHeader(title: AppAssets.recommendedForYou),
          const AppSpacer(height: 16),
          SizedBox(
            height: 300,
            child: ListView.separated(
              itemCount: subscribeAuthorData.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final subAuthorData = subscribeAuthorData[index];
                return _RecommendedItem(subAuthorData: subAuthorData);
              },
              separatorBuilder: (context, index) => const AppSpacer(width: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendedItem extends StatelessWidget {
  const _RecommendedItem({required this.subAuthorData});

  final SubscribeAuthorData subAuthorData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/podcast'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 220,
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFD7F0E3),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 3),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(subAuthorData.image),
              ),
            ),
          ),
          const AppSpacer(height: 12),
          Text(
            subAuthorData.podcastHost ?? '',
            style: const TextStyle(fontSize: 14),
          ),
          const AppSpacer(height: 4),
          SizedBox(
            width: 220,
            child: Text(
              subAuthorData.podcastDescription ?? '',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D2D2D),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentlyPlayedList extends StatelessWidget {
  const _RecentlyPlayedList();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSpacer(height: 8),
          const AppTextHeader(title: AppAssets.recentlyPlayed),
          const AppSpacer(height: 4),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: subscribeAuthorData.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final podcast = subscribeAuthorData[index];
              return _RecentlyPlayedItem(podcast: podcast);
            },
          ),
          const AppSpacer(height: 32),
        ],
      ),
    );
  }
}

class _RecentlyPlayedItem extends StatelessWidget {
  const _RecentlyPlayedItem({required this.podcast});

  final SubscribeAuthorData podcast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 3),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      podcast.image,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const AppSpacer(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      Text(
                        podcast.podcastHost!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text(
                        podcast.podCastName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        podcast.podcastDescription!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      Text(
                        '• ${podcast.podcastTime!}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const AppSpacer(width: 6),
          IconButton(
            style: IconButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () {},
            icon: const Icon(Icons.play_arrow, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
