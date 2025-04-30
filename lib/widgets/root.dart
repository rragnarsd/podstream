import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum TabItem { home, search, profile }

class Root extends StatefulWidget {
  const Root({super.key, required this.child});

  final Widget child;

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  TabItem _selectedTab = TabItem.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab.index,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 20),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 20),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 20),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    final selected = TabItem.values[index];

    setState(() => _selectedTab = selected);

    final route = switch (selected) {
      TabItem.home => '/',
      TabItem.search => '/search',
      TabItem.profile => '/profile',
    };

    context.go(route);
  }
}
