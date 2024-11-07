// lib/features/achievements/screens/achievement_list_screen.dart
import 'package:flutter/material.dart';

class AchievementListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return AchievementCard(
            achievement: achievements[index],
            onTap: () => _showAchievementDetails(context, achievements[index]),
          );
        },
      ),
    );
  }
}