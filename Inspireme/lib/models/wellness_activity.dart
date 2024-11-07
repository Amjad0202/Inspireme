class WellnessActivity {
  final String id;
  final String title;
  final String description;
  final String type; // meditation, exercise, journaling, etc.
  final int durationMinutes;
  final bool completed;

  WellnessActivity({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.durationMinutes,
    this.completed = false,
  });
}