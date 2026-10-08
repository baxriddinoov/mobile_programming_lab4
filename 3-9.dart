import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  static const List<Widget> _pages = [
    _HomeTab(),
    _PlaceholderPage(icon: Icons.search, text: 'Search', withAppBar: true),
    _PlaceholderPage(icon: Icons.person, text: 'Profile', withAppBar: true),
  ];

  @override
  Widget build(BuildContext context) {
    //9.1
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

//9.2
class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task 9: Navigation'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat), text: 'Chats'),
              Tab(icon: Icon(Icons.update), text: 'Status'),
              Tab(icon: Icon(Icons.call), text: 'Calls'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _PlaceholderPage(icon: Icons.chat, text: 'Chats'),
            _PlaceholderPage(icon: Icons.update, text: 'Status'),
            _PlaceholderPage(icon: Icons.call, text: 'Calls'),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool withAppBar;
  const _PlaceholderPage(
      {required this.icon, required this.text, this.withAppBar = false});

  @override
  Widget build(BuildContext context) {
    final page = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 80, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 12),
          Text(text, style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
    return withAppBar
        ? Scaffold(appBar: AppBar(title: Text(text)), body: page)
        : page;
  }
}
