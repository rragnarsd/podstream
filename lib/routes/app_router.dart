import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/screens/home_screen.dart';
import 'package:podstream/screens/interest_screen.dart';
import 'package:podstream/screens/onboarding_screen.dart';
import 'package:podstream/screens/podcast_play_screen.dart';
import 'package:podstream/screens/podcast_screen.dart';
import 'package:podstream/screens/premium_screen.dart';
import 'package:podstream/screens/search_screen.dart';
import 'package:podstream/screens/profile_screen.dart';
import 'package:podstream/screens/subscribe_screen.dart';
import 'package:podstream/root.dart';
import 'package:podstream/utils/shared_prefs.dart';

enum AppRoute {
  onboarding,
  interests,
  subscribe,
  home,
  search,
  podcast,
  profile,
  premium,
  play,
}

extension AppRouteExtension on AppRoute {
  String get path => switch (this) {
    AppRoute.onboarding => '/onboarding',
    AppRoute.interests => 'interests',
    AppRoute.subscribe => 'subscribe',
    AppRoute.home => '/',
    AppRoute.search => '/search',
    AppRoute.podcast => '/podcast',
    AppRoute.profile => '/profile',
    AppRoute.premium => '/premium',
    AppRoute.play => '/podcast/play',
  };

  String get name => toString().split('.').last;
}

GoRoute buildRoute(
  AppRoute route,
  Widget screen, {
  List<GoRoute> routes = const [],
}) {
  return GoRoute(
    path: route.path,
    name: route.name,
    builder: (BuildContext context, GoRouterState state) => screen,
    routes: routes,
  );
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) async {
    final hasSeenOnboarding = await SharedPrefs.hasSeenOnboarding();
    if (!hasSeenOnboarding && state.matchedLocation != '/onboarding') {
      return '/onboarding';
    }
    return null;
  },
  routes: <RouteBase>[
    buildRoute(
      AppRoute.onboarding,
      const OnboardingScreen(),
      routes: [
        buildRoute(AppRoute.interests, const InterestScreen()),
        buildRoute(AppRoute.subscribe, const SubscribeScreen()),
      ],
    ),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Root(child: child);
      },
      routes: [
        buildRoute(AppRoute.home, const HomeScreen()),
        buildRoute(AppRoute.search, const SearchScreen()),
        buildRoute(AppRoute.podcast, const PodcastScreen()),
        buildRoute(AppRoute.profile, const ProfileScreen()),
        buildRoute(AppRoute.premium, const PremiumScreen()),
      ],
    ),
    buildRoute(AppRoute.play, const PodcastPlayScreen()),
  ],
);
