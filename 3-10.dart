import 'package:flutter/material.dart';

class ContainersScreen extends StatelessWidget {
  const ContainersScreen({super.key});

  static const List<(String, String)> _faqs = [
    (
    'What is Flutter?',
    'Flutter is Google\'s open-source UI toolkit for building natively '
        'compiled apps for mobile, web and desktop from a single codebase.'
    ),
    (
    'What is a StatefulWidget?',
    'A widget that has mutable State. Calling setState() tells Flutter to '
        'rebuild the widget with the new values.'
    ),
    (
    'What is hot reload?',
    'Hot reload injects updated source code into the running Dart VM, so '
        'you see UI changes in about a second without losing app state.'
    ),
    (
    'Which language does Flutter use?',
    'Flutter apps are written in Dart.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 10: Card & FAQ')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          //10.1
          Card(
            elevation: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.school, size: 40),
                  title: const Text('Mobile Programming',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Lab 4 • Flutter Widgets'),
                  trailing: IconButton(
                    icon: const Icon(Icons.bookmark_add_outlined),
                    onPressed: () =>
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Saved to bookmarks')),
                        ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    'Explore essential Flutter UI widgets for cross-platform '
                        'iOS and Android development.',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text('Frequently Asked Questions',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          //10.2
          for (final (question, answer) in _faqs)
            Card(
              child: ExpansionTile(
                leading: const Icon(Icons.help_outline),
                title: Text(question),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(answer)],
              ),
            ),
        ],
      ),
    );
  }
}
