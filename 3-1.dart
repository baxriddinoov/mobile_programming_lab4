import 'package:flutter/material.dart';

final ValueNotifier<bool> darkMode = ValueNotifier(false);

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 1: Settings')),
      body: ListView(
        children: [
          // 1.1
          SwitchListTile(
            title: const Text('Dark Mode'),
            secondary: const Icon(Icons.dark_mode),
            value: darkMode.value,
            onChanged: (value) => setState(() => darkMode.value = value),
          ),

          CheckboxListTile(
            title: const Text('Agree to Terms'),
            subtitle: const Text('Required to continue'),
            controlAffinity: ListTileControlAffinity.leading,
            value: _agreeToTerms,
            onChanged: (value) =>
                setState(() => _agreeToTerms = value ?? false),
          ),
          const SizedBox(height: 16),
          // 1.2
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: _agreeToTerms
                  ? () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Continuing...')),
              )
                  : null, // null => disabled
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
