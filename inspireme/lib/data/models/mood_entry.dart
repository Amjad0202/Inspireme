// lib/data/models/mood_entry.dart
class MoodEntry {
  final String id;
  final DateTime date;
  final int moodScore; // 1-5 scale
  final String note;
  final List<String> tags;

  MoodEntry({
    required this.id,
    required this.date,
    required this.moodScore,
    this.note = '',
    this.tags = const [],
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date.toIso8601String(),
    'moodScore': moodScore,
    'note': note,
    'tags': tags,
  };
}