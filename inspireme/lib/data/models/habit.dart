// lib/data/models/habit.dart
class Habit {
  final String id;
  final String title;
  final String description;
  final List<String> frequency; // days of week
  final TimeOfDay reminderTime;
  final Color color;
  final String icon;
  final int currentStreak;
  final int bestStreak;

  Habit({
    required this.id,
    required this.title,
    required this.description,
    required this.frequency,
    required this.reminderTime,
    required this.color,
    required this.icon,
    this.currentStreak = 0,
    this.bestStreak = 0,
  });
}