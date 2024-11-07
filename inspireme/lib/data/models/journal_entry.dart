// lib/data/models/journal_entry.dart
class JournalEntry {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final List<String> tags;
  final String mood;

  JournalEntry({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    this.tags = const [],
    this.mood = '',
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'createdAt': createdAt.toIso8601String(),
    'tags': tags,
    'mood': mood,
  };
}