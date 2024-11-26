// lib/models/meditation_session.dart
class MeditationSession {
  final String id;
  final String title;
  final String description;
  final Duration duration;
  final String audioUrl;
  final String imageUrl;
  final List<String> tags;
  final bool isPremium;

  MeditationSession({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.audioUrl,
    required this.imageUrl,
    required this.tags,
    this.isPremium = false,
  });
}

// lib/models/mood_entry.dart
class MoodEntry {
  final DateTime timestamp;
  final int moodScore; // 1-5
  final List<String> emotions;
  final String note;
  final List<String> activities;

  MoodEntry({
    required this.timestamp,
    required this.moodScore,
    required this.emotions,
    required this.note,
    required this.activities,
  });
}

// lib/models/wellness_goal.dart
class WellnessGoal {
  final String id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime? endDate;
  final int targetValue;
  final int currentValue;
  final String metric;
  final bool isCompleted;

  WellnessGoal({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    this.endDate,
    required this.targetValue,
    required this.currentValue,
    required this.metric,
    this.isCompleted = false,
  });

  double get progress => currentValue / targetValue;
}