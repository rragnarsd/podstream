import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/utils/constants/pod_assets.dart';
import 'package:podstream/utils/constants/pod_colors.dart';
import 'package:podstream/utils/constants/pod_text_styles.dart';
import 'package:podstream/widgets/buttons.dart';

class PodcastPlayScreen extends StatelessWidget {
  const PodcastPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [_TopImageSection(), _PodcastDetailsSection()]),
    );
  }
}

class _TopImageSection extends StatelessWidget {
  const _TopImageSection();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * .64,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.avatar1),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 46,
          left: 0,
          child: AppIconButton(
            icon: Icons.arrow_back_ios_new_rounded,
            iconSize: 20,
            iconColor: PodColors.textColor,
            onPressed: () => context.pop(),
            backgroundColor: PodColors.transparentColor,
            borderColor: PodColors.transparentColor,
          ),
        ),
        Positioned(
          bottom: 24,
          right: 24,
          child: Container(
            width: MediaQuery.sizeOf(context).width * .4,
            decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(4),
              color: PodColors.whiteColor,
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.share, color: PodColors.textColor),
                  Icon(Icons.favorite_border, color: PodColors.textColor),
                  Icon(Icons.download_rounded, color: PodColors.textColor),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PodcastDetailsSection extends StatelessWidget {
  const _PodcastDetailsSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: PodColors.textColor, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppAssets.host,
                  style: PodTextStyles.bodyLarge.copyWith(
                    color: PodColors.textColor.withValues(alpha: .4),
                  ),
                ),
                const Text(AppAssets.podcastName, style: PodTextStyles.header2),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Column(
            children: [
              SizedBox(
                height: 62,
                width: double.infinity,
                child: Image.asset(AppAssets.wave, fit: BoxFit.cover),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(AppAssets.timeOne), Text(AppAssets.timeTwo)],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.skip_previous, size: 30),
                Icon(Icons.replay_10, size: 30),
                CircleAvatar(
                  backgroundColor: PodColors.tealColor,
                  radius: 30,
                  child: Icon(
                    Icons.play_arrow,
                    color: PodColors.whiteColor,
                    size: 40,
                  ),
                ),
                Icon(Icons.forward_10, size: 30),
                Icon(Icons.skip_next, size: 30),
              ],
            ),
          ),
          //const SizedBox(height: 12),
        ],
      ),
    );
  }
}
