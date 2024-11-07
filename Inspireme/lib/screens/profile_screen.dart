// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            ProfileMenuCard(
              title: 'Notification Settings',
              icon: Icons.notifications,
              onTap: () {
                // Navigate to notification settings
              },
            ),
            ProfileMenuCard(
              title: 'Progress Statistics',
              icon: Icons.bar_chart,
              onTap: () {
                // Navigate to progress statistics
              },
            ),
            ProfileMenuCard(
              title: 'Privacy Settings',
              icon: Icons.privacy_tip,
              onTap: () {
                // Navigate to privacy settings
              },
            ),
            ProfileMenuCard(
              title: 'Help & Support',
              icon: Icons.help,
              onTap: () {
                // Navigate to help & support
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileMenuCard({super.key, 
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}