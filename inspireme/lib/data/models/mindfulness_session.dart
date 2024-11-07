// lib/data/models/mindfulness_session.dart
class MindfulnessSession {
  final String id;
  final String title;
  final int duration;
  final String type;
  final String audioUrl;
  final String description;

  MindfulnessSession({
    required this.id,
    required this.title,
    required this.duration,
    required this.type,
    required this.audioUrl,
    required this.description,
  });
}