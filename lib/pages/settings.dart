import 'package:flutter/material.dart';
import 'package:news_app/components/settings_tile.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SettingsTile()
        ],
      ),
    );
  }
}
