// lib/data/models/user_model.dart
class UserModel {
  final String id;
  final String email;
  final String name;
  final List<String> preferences;
  
  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.preferences = const [],
  });
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      preferences: List<String>.from(json['preferences'] ?? []),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'preferences': preferences,
    };
  }
}