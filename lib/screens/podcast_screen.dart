import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/routes/app_router.dart';
import 'package:podstream/screens/search_screen.dart';
import 'package:podstream/utils/constants/pod_assets.dart';
import 'package:podstream/utils/constants/pod_colors.dart';
import 'package:podstream/utils/constants/pod_text_styles.dart';
import 'package:podstream/widgets/buttons.dart';
import 'package:podstream/widgets/spacers.dart';
import 'package:podstream/widgets/text_headers.dart';

class PodcastScreen extends StatefulWidget {
  const PodcastScreen({super.key});

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen>
    with SingleTickerProviderStateMixin<PodcastScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isCollapsed = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      final bool isCollapsed = _scrollController.offset > 100;
      if (isCollapsed != _isCollapsed) {
        setState(() => _isCollapsed = isCollapsed);
        if (isCollapsed) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              PodcastSliverAppBar(
                isCollapsed: _isCollapsed,
                animation: _animation,
                scrollController: _scrollController,
              ),
              const SliverAppSpacer(height: 24),
              const SliverAppTextHeader(title: 'All Episodes'),
              const SliverAppSpacer(height: 8),
              const PodcastList(),
              const SliverAppSpacer(height: 24),
            ],
          ),
        ],
      ),
    );
  }
}

class PodcastSliverAppBar extends StatelessWidget {
  const PodcastSliverAppBar({
    super.key,
    required this.isCollapsed,
    required this.animation,
    required this.scrollController,
  });

  final bool isCollapsed;
  final Animation<double> animation;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 300,
      backgroundColor:
          isCollapsed ? PodColors.tealColor : PodColors.transparentColor,
      leading: AppIconButton(
        icon: Icons.arrow_back_ios_new_rounded,
        iconSize: 20,
        iconColor: PodColors.whiteColor,
        onPressed: () => context.pop<Object>(),
        backgroundColor: PodColors.transparentColor,
        borderColor: PodColors.transparentColor,
      ),
      actions: [
        AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: animation.value,
              child: AppIconButton(
                icon: Icons.person_add_alt,
                iconColor: PodColors.whiteColor,
                onPressed: () {},
                backgroundColor: PodColors.transparentColor,
                borderColor: PodColors.transparentColor,
              ),
            );
          },
        ),
        AppIconButton(
          icon: Icons.share,
          iconColor: PodColors.whiteColor,
          onPressed: () => context.push<Object>(AppRoute.premium.path),
          backgroundColor: PodColors.transparentColor,
          borderColor: PodColors.transparentColor,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: isCollapsed ? 1.0 : 0.0,
          child: Text(
            AppAssets.host,
            style: PodTextStyles.header2.copyWith(color: PodColors.whiteColor),
          ),
        ),
        background: SizedBox(
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Hero(
                tag: AppAssets.avatar1,
                child: Image.asset(AppAssets.avatar1, fit: BoxFit.cover),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      PodColors.transparentColor,
                      PodColors.textColor.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          AppAssets.host,
                          style: PodTextStyles.header1.copyWith(
                            color: PodColors.whiteColor,
                          ),
                        ),
                        Text(
                          AppAssets.podcastName,
                          style: PodTextStyles.bodyLarge.copyWith(
                            color: PodColors.whiteColor.withValues(alpha: .6),
                          ),
                        ),
                      ],
                    ),
                    AnimatedBuilder(
                      animation: animation,
                      builder: (BuildContext context, Widget? child) {
                        return Opacity(
                          opacity: 1 - animation.value,
                          child: AppIconButtonOutlined(
                            title: AppAssets.followButton,
                            icon: Icons.person_add_alt,
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
