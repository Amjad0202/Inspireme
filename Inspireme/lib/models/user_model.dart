class UserModel {
  final String id;
  final String name;
  final String email;
  final List<String> goals;
  final int streakDays;
  final Map<String, double> progressMetrics;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.goals,
    required this.streakDays,
    required this.progressMetrics,
  });
}