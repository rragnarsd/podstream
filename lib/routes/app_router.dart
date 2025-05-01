import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/screens/home_screen.dart';
import 'package:podstream/screens/interest_screen.dart';
import 'package:podstream/screens/onboarding_screen.dart';
import 'package:podstream/screens/podcast_screen.dart';
import 'package:podstream/screens/premium_screen.dart';
import 'package:podstream/screens/search_screen.dart';
import 'package:podstream/screens/profile_screen.dart';
import 'package:podstream/screens/subscribe_screen.dart';
import 'package:podstream/widgets/root.dart';
import 'package:podstream/utils/shared_prefs.dart';

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
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),
    GoRoute(
      path: '/onboarding/interests',
      name: 'interests',
      builder: (BuildContext context, GoRouterState state) {
        return const InterestScreen();
      },
    ),
    GoRoute(
      path: '/onboarding/subscribe',
      name: 'subscribe',
      builder: (BuildContext context, GoRouterState state) {
        return const SubscribeScreen();
      },
    ),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Root(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: '/search',
          name: 'search',
          builder: (BuildContext context, GoRouterState state) {
            return const SearchScreen();
          },
        ),
        GoRoute(
          path: '/podcast',
          name: 'podcast',
          builder: (BuildContext context, GoRouterState state) {
            return const PodcastScreen();
          },
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileScreen();
          },
        ),
        GoRoute(
          path: '/premium',
          name: 'premium',
          builder: (BuildContext context, GoRouterState state) {
            return const PremiumScreen();
          },
        ),
      ],
    ),
  ],
);
