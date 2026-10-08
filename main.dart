import 'package:flutter/material.dart';

import '3-1.dart';
import '3-2.dart';
import '3-3.dart';
import '3-4.dart';
import '3-5.dart';
import '3-6.dart';
import '3-7.dart';
import '3-8.dart';
import '3-9.dart';
import '3-10.dart';

void main() => runApp(const Lab4App());

class Lab4App extends StatelessWidget {
  const Lab4App({super.key});

  @override
  Widget build(BuildContext context) {
    // Rebuilds the whole app when the Dark Mode switch in Task 1 changes.
    return ValueListenableBuilder<bool>(
      valueListenable: darkMode,
      builder: (context, isDark, _) => MaterialApp(
        title: 'Lab 4: Flutter Widgets',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorSchemeSeed: Colors.indigo),
        darkTheme: ThemeData(
          colorSchemeSeed: Colors.indigo,
          brightness: Brightness.dark,
        ),
        themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        home: const HomeScreen(),
      ),
    );
  }
}

class _Entry {
  final String title;
  final String subtitle;
  final IconData icon;
  final WidgetBuilder builder;
  const _Entry(this.title, this.subtitle, this.icon, this.builder);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<_Entry> _entries = [
    _Entry('Task 1', 'Checkbox & Switch', Icons.toggle_on,
        (_) => const SettingsScreen()),
    _Entry('Task 2', 'TextField & TextFormField', Icons.keyboard,
        (_) => const LoginScreen()),
    _Entry('Task 3', 'FAB & Buttons', Icons.add_circle,
        (_) => const CounterScreen()),
    _Entry('Task 4', 'Progress & SnackBar', Icons.hourglass_bottom,
        (_) => const FeedbackScreen()),
    _Entry('Task 5', 'AlertDialog & BottomSheet', Icons.chat_bubble,
        (_) => const DialogsScreen()),
    _Entry('Task 6', 'Slider & DatePicker', Icons.tune,
        (_) => const SlidersScreen()),
    _Entry('Task 7', 'ListView.builder & Dismissible', Icons.list,
        (_) => const ListScreen()),
    _Entry('Task 8', 'GridView.count gallery', Icons.grid_view,
        (_) => const GalleryScreen()),
    _Entry('Task 9', 'BottomNavigationBar & TabBar', Icons.tab,
        (_) => const NavigationScreen()),
    _Entry('Task 10', 'Card & ExpansionTile', Icons.credit_card,
        (_) => const ContainersScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab 4: Flutter Widgets')),
      body: ListView.separated(
        itemCount: _entries.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, i) {
          final e = _entries[i];
          return ListTile(
            leading: Icon(e.icon),
            title: Text(e.title),
            subtitle: Text(e.subtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: e.builder)),
          );
        },
      ),
    );
  }
}
