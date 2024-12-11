// lib/services/auth_service.dart
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inspire/models/wellness_activity.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      return _userFromFirebase(result.user);
    } catch (e) {
      return null;
    }
  }

  User? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return user;
  }
}

// lib/screens/home_screen.dart - Update WellnessCard
class WellnessCard extends StatelessWidget {
  final List<WellnessActivity> activities;
  
  const WellnessCard({
    super.key,
    required this.activities,
  });

  @override 
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today\'s Wellness Activities',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...activities.map((activity) => 
              _buildActivityTile(activity)
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityTile(WellnessActivity activity) {
    return ListTile(
      leading: Icon(_getActivityIcon(activity.type)),
      title: Text(activity.title),
      subtitle: Text('${activity.durationMinutes} minutes'),
      trailing: Checkbox(
        value: activity.completed,
        onChanged: (bool? value) {
          // TODO: Update activity completion
        },
      ),
    );
  }

  IconData _getActivityIcon(String type) {
    switch (type) {
      case 'meditation':
        return Icons.self_improvement;
      case 'exercise':
        return Icons.fitness_center;
      case 'journaling':
        return Icons.book;
      default:
        return Icons.check_circle;
    }
  }
}

// lib/screens/mindfulness_screen.dart - Add MeditationTimer
class MeditationTimer extends StatefulWidget {
  final int durationMinutes;
  
  const MeditationTimer({
    super.key,
    required this.durationMinutes,
  });

  @override
  State<MeditationTimer> createState() => _MeditationTimerState();
}

class _MeditationTimerState extends State<MeditationTimer> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.durationMinutes * 60;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${_remainingSeconds ~/ 60}:${(_remainingSeconds % 60).toString().padLeft(2, '0')}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        ElevatedButton(
          onPressed: _startTimer,
          child: const Text('Start Session'),
        ),
      ],
    );
  }
}

// lib/models/mood_entry.dart
class MoodEntry {
  final DateTime date;
  final int moodScore; // 1-5
  final String note;

  MoodEntry({
    required this.date,
    required this.moodScore,
    required this.note,
  });
}