import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/screens/home_screen.dart';
import 'package:podstream/screens/premium_screen.dart';
import 'package:podstream/screens/search_screen.dart';
import 'package:podstream/screens/profile_screen.dart';
import 'package:podstream/widgets/root.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
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
