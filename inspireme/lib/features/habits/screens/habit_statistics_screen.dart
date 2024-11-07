// lib/features/habits/screens/habit_statistics_screen.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HabitStatisticsScreen extends StatelessWidget {
  final Habit habit;

  const HabitStatisticsScreen({
    Key? key,
    required this.habit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStreakCard(),
            SizedBox(height: 16),
            _buildCompletionChart(),
            SizedBox(height: 16),
            _buildWeeklyBreakdown(),
          ],
        ),
      ),
    );
  }

  Widget _buildStreakCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStreakInfo(
              'Current Streak',
              '${habit.currentStreak} days',
              Icons.local_fire_department,
            ),
            _buildStreakInfo(
              'Best Streak',
              '${habit.bestStreak} days',
              Icons.emoji_events,
            ),
            _buildStreakInfo(
              'Completion Rate',
              '87%',
              Icons.check_circle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStreakInfo(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.orange),
        SizedBox(height: 8),
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(title, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildCompletionChart() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Completion History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(1, 1),
                        FlSpot(2, 4),
                        FlSpot(3, 2),
                        FlSpot(4, 5),
                        FlSpot(5, 3),
                        FlSpot(6, 4),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyBreakdown() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weekly Breakdown',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildDayCompletion('M', true),
                _buildDayCompletion('T', true),
                _buildDayCompletion('W', false),
                _buildDayCompletion('T', true),
                _buildDayCompletion('F', true),
                _buildDayCompletion('S', false),
                _buildDayCompletion('S', true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayCompletion(String day, bool completed) {
    return Column(
      children: [
        Text(day),
        SizedBox(height: 4),
        Icon(
          completed ? Icons.check_circle : Icons.circle_outlined,
          color: completed ? Colors.green : Colors.grey,
        ),
      ],
    );
  }
}