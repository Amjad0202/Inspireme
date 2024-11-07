// lib/data/repositories/habit_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class HabitRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _userId;

  HabitRepository(this._userId);

  Future<void> createHabit(Habit habit) async {
    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('habits')
        .doc(habit.id)
        .set(habit.toJson());
  }

  Future<List<Habit>> getHabits() async {
    final snapshot = await _firestore
        .collection('users')
        .doc(_userId)
        .collection('habits')
        .get();

    return snapshot.docs
        .map((doc) => Habit.fromJson(doc.data()))
        .toList();
  }

  Future<void> updateHabit(Habit habit) async {
    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('habits')
        .doc(habit.id)
        .update(habit.toJson());
  }

  Future<void> deleteHabit(String habitId) async {
    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('habits')
        .doc(habitId)
        .delete();
  }

  Future<void> logHabitCompletion(String habitId) async {
    final now = DateTime.now();
    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('habits')
        .doc(habitId)
        .collection('logs')
        .add({
          'completedAt': now.toIso8601String(),
          'createdAt': FieldValue.serverTimestamp(),
        });
    
    await _updateStreak(habitId);
  }

  Future<void> _updateStreak(String habitId) async {
    final logsSnapshot = await _firestore
        .collection('users')
        .doc(_userId)
        .collection('habits')
        .doc(habitId)
        .collection('logs')
        .orderBy('completedAt', descending: true)
        .get();

    final dates = logsSnapshot.docs
        .map((doc) => DateTime.parse(doc.data()['completedAt'] as String))
        .toList();

    int currentStreak = _calculateStreak(dates);
    
    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('habits')
        .doc(habitId)
        .update({'currentStreak': currentStreak});
  }

  int _calculateStreak(List<DateTime> dates) {
    if (dates.isEmpty) return 0;

    int streak = 1;
    final today = DateTime.now();
    final yesterday = today.subtract(Duration(days: 1));

    // Check if the most recent date is today or yesterday
    if (!dates.any((date) => 
        date.year == today.year && 
        date.month == today.month && 
        date.day == today.day) &&
        !dates.any((date) => 
        date.year == yesterday.year && 
        date.month == yesterday.month && 
        date.day == yesterday.day)) {
      return 0;
    }

    for (int i = 0; i < dates.length - 1; i++) {
      final current = dates[i];
      final next = dates[i + 1];
      final difference = current.difference(next).inDays;

      if (difference == 1) {
        streak++;
      } else {
        break;
      }
    }

    return streak;
  }
}