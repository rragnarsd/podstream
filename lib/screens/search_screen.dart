import 'package:flutter/material.dart';
import 'package:podstream/local_data/category_data.dart';
import 'package:podstream/local_data/subscribe_data.dart';
import 'package:podstream/utils/constants/pod_assets.dart';
import 'package:podstream/utils/constants/pod_colors.dart';
import 'package:podstream/utils/constants/pod_text_styles.dart';
import 'package:podstream/widgets/buttons.dart';
import 'package:podstream/widgets/spacers.dart';
import 'package:podstream/widgets/text_headers.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Image.asset(AppAssets.logo),
        leadingWidth: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: AppIconButton(
              icon: Icons.filter_list,
              iconColor: PodColors.textColor,
              onPressed: () {},
              backgroundColor: PodColors.transparentColor,
              borderColor: PodColors.transparentColor,
            ),
          ),
        ],
      ),
      body: const CustomScrollView(
        slivers: [
          SearchField(),
          SliverAppSpacer(height: 32),
          SliverAppTextHeader(title: AppAssets.topCategories),
          SliverAppSpacer(height: 12),
          CategoryList(),
          SliverAppSpacer(height: 32),
          SliverAppTextHeader(title: AppAssets.popularPodcasts),
          SliverAppSpacer(height: 4),
          PodcastList(),
          SliverAppSpacer(height: 24),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      sliver: SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: AppAssets.searchPodcasts,
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 90,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryItem(category: category);
          },
          separatorBuilder: (context, index) => const AppSpacer(width: 12),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryData category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 3),
        color: category.color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              category.category,
              style: PodTextStyles.bodyLarge.copyWith(
                color: category.textColor,
              ),
            ),
            const AppSpacer(width: 8),
            Text(
              category.podcastCount,
              style: PodTextStyles.bodyMedium.copyWith(
                color: category.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PodcastList extends StatelessWidget {
  const PodcastList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final podcast = subscribeAuthorData[index];
          return PodCastItem(podcast: podcast);
        }, childCount: 6),
      ),
    );
  }
}

class PodCastItem extends StatelessWidget {
  const PodCastItem({super.key, required this.podcast});

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
                    children: [
                      Text(
                        podcast.podcastHost!,
                        style: PodTextStyles.bodySmall.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const AppSpacer(height: 4),
                      Text(
                        podcast.podCastName,
                        style: PodTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const AppSpacer(height: 4),
                      Text(
                        podcast.podcastDescription!,
                        style: PodTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const AppSpacer(height: 4),
                      Text(
                        '• ${podcast.podcastTime!} min',
                        style: PodTextStyles.bodySmall.copyWith(
                          color: PodColors.textColor.withValues(alpha: .6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const AppSpacer(width: 6),
          AppIconButton(
            icon: Icons.play_arrow,
            onPressed: () {},
            backgroundColor: PodColors.tealColor,
            iconColor: PodColors.whiteColor,
            borderColor: PodColors.transparentColor,
          ),
        ],
      ),
    );
  }
}
