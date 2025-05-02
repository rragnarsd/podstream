import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/screens/search_screen.dart';
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
    with SingleTickerProviderStateMixin {
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

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      final bool isCollapsed = _scrollController.offset > 100;
      if (isCollapsed != _isCollapsed) {
        setState(() {
          _isCollapsed = isCollapsed;
        });
        if (isCollapsed) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 300,
                backgroundColor:
                    _isCollapsed
                        ? PodColors.tealColor
                        : PodColors.transparentColor,
                leading: AppIconButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  iconSize: 20,
                  iconColor: PodColors.whiteColor,
                  onPressed: () => context.pop(),
                  backgroundColor: PodColors.transparentColor,
                  borderColor: PodColors.transparentColor,
                ),
                actions: [
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _animation.value,
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
                    onPressed: () => context.push('/premium'),
                    backgroundColor: PodColors.transparentColor,
                    borderColor: PodColors.transparentColor,
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _isCollapsed ? 1.0 : 0.0,
                    child: Text(
                      'Liliy\'s wellness',
                      style: PodTextStyles.header2.copyWith(
                        color: PodColors.whiteColor,
                      ),
                    ),
                  ),
                  background: SizedBox(
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/avatar1.png',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
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
                                children: [
                                  Text(
                                    'Liliy\'s wellness',
                                    style: PodTextStyles.header1.copyWith(
                                      color: PodColors.whiteColor,
                                    ),
                                  ),
                                  Text(
                                    'Health & Wellness Podcast',
                                    style: PodTextStyles.bodyLarge.copyWith(
                                      color: PodColors.whiteColor.withValues(
                                        alpha: .6,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AnimatedBuilder(
                                animation: _animation,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity: 1 - _animation.value,
                                    child: AppIconButtonOutlined(
                                      title: 'Follow',
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
