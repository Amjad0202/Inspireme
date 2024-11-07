// lib/features/settings/screens/settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _reminderSound = true;
  bool _darkMode = false;
  TimeOfDay _defaultReminderTime = TimeOfDay(hour: 9, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Notifications'),
            subtitle: Text('Enable or disable all notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() => _notificationsEnabled = value);
                // TODO: Update notification preferences
              },
            ),
          ),
          ListTile(
            title: Text('Reminder Sound'),
            subtitle: Text('Play sound with notifications'),
            enabled: _notificationsEnabled,
            trailing: Switch(
              value: _reminderSound,
              onChanged: _notificationsEnabled 
                  ? (value) => setState(() => _reminderSound = value)
                  : null,
            ),
          ),
          ListTile(
            title: Text('Default Reminder Time'),
            subtitle: Text(_defaultReminderTime.format(context)),
            enabled: _notificationsEnabled,
            onTap: _notificationsEnabled ? _showTimePicker : null,
          ),
          Divider(),
          ListTile(
            title: Text('Dark Mode'),
            subtitle: Text('Switch between light and dark theme'),
            trailing: Switch(
              value: _darkMode,
              onChanged: (value) {
                setState(() => _darkMode = value);
                // TODO: Update theme
              },
            ),
          ),
          ListTile(
            title: Text('Export Data'),
            subtitle: Text('Backup your habits and progress'),
            trailing: Icon(Icons.download),
            onTap: _exportData,
          ),
          ListTile(
            title: Text('Import Data'),
            subtitle: Text('Restore from backup'),
            trailing: Icon(Icons.upload),
            onTap: _importData,
          ),
          ListTile(
            title: Text('About'),
            subtitle: Text('Version 1.0.0'),
            trailing: Icon(Icons.info_outline),
            onTap: _showAboutDialog,
          ),
        ],
      ),
    );
  }

  Future<void> _showTimePicker() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: _defaultReminderTime,
    );
    if (time != null) {
      setState(() => _defaultReminderTime = time);
      // TODO: Update default reminder time
    }
  }

  Future<void> _exportData() async {
    // TODO: Implement data export
  }

  Future<void> _importData() async {
    // TODO: Implement data import
  }

  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'Habit Tracker',
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2024',
    );
  }
}