// lib/features/mood/screens/mood_calendar_screen.dart
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MoodCalendarScreen extends StatefulWidget {
  const MoodCalendarScreen({super.key});

  @override
  _MoodCalendarScreenState createState() => _MoodCalendarScreenState();
}

class _MoodCalendarScreenState extends State<MoodCalendarScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  final DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final Map<DateTime, MoodEntry> _moodEntries = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mood Tracker')),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2024, 1, 1),
            lastDay: DateTime.utc(2024, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              _showMoodDialog(selectedDay);
            },
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (_moodEntries.containsKey(date)) {
                  return _buildMoodIndicator(_moodEntries[date]!.moodScore);
                }
                return null;
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMoodDialog(_focusedDay),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMoodIndicator(int moodScore) {
    Color color;
    switch (moodScore) {
      case 1: color = Colors.red;
      case 2: color = Colors.orange;
      case 3: color = Colors.yellow;
      case 4: color = Colors.lightGreen;
      case 5: color = Colors.green;
      default: color = Colors.grey;
    }

    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  void _showMoodDialog(DateTime date) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('How are you feeling?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 5; i >= 1; i--)
              ListTile(
                leading: Icon(_getMoodIcon(i)),
                title: Text(_getMoodLabel(i)),
                onTap: () {
                  setState(() {
                    _moodEntries[date] = MoodEntry(
                      id: DateTime.now().toString(),
                      date: date,
                      moodScore: i,
                    );
                  });
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }

  IconData _getMoodIcon(int score) {
    switch (score) {
      case 1: return Icons.sentiment_very_dissatisfied;
      case 2: return Icons.sentiment_dissatisfied;
      case 3: return Icons.sentiment_neutral;
      case 4: return Icons.sentiment_satisfied;
      case 5: return Icons.sentiment_very_satisfied;
      default: return Icons.mood;
    }
  }

  String _getMoodLabel(int score) {
    switch (score) {
      case 1: return 'Very Bad';
      case 2: return 'Bad';
      case 3: return 'Okay';
      case 4: return 'Good';
      case 5: return 'Excellent';
      default: return '';
    }
  }
}