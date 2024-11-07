// lib/screens/progress_screen.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Statistics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildWeeklyActivity(),
            const SizedBox(height: 24),
            _buildHabitTracking(),
            const SizedBox(height: 24),
            _buildAchievements(),
            const SizedBox(height: 24),
            _buildMoodTrends(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Progress',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: _buildStatItem('Current Streak', '7 days'),
              ),
              const VerticalDivider(),
              Expanded(
                child: _buildStatItem('Total Minutes', '420'),
              ),
              const VerticalDivider(),
              Expanded(
                child: _buildStatItem('Achievements', '12'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWeeklyActivity() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weekly Activity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  barGroups: [
                    _buildBarGroup(0, 30, 'Mon'),
                    _buildBarGroup(1, 45, 'Tue'),
                    _buildBarGroup(2, 65, 'Wed'),
                    _buildBarGroup(3, 40, 'Thu'),
                    _buildBarGroup(4, 55, 'Fri'),
                    _buildBarGroup(5, 70, 'Sat'),
                    _buildBarGroup(6, 50, 'Sun'),
                  ],
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                          return Text(days[value.toInt()]);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int x, double value, String label) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: Colors.blue,
          width: 16,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  Widget _buildHabitTracking() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Habit Tracking',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildHabitCard('Daily Meditation', 0.8),
        const SizedBox(height: 8),
        _buildHabitCard('Mindful Breaks', 0.6),
        const SizedBox(height: 8),
        _buildHabitCard('Journaling', 0.4),
      ],
    );
  }

  Widget _buildHabitCard(String title, double progress) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 8),
            Text('${(progress * 100).toInt()}% completed'),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Achievements',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildAchievementItem('Completed 30-day challenge'),
        const SizedBox(height: 8),
        _buildAchievementItem('Reached 1000 minutes of meditation'),
        const SizedBox(height: 8),
        _buildAchievementItem('Maintained a 7-day streak'),
      ],
    );
  }

  Widget _buildAchievementItem(String title) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: Colors.green),
        const SizedBox(width: 8),
        Text(title),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildMoodTrends() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mood Trends',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        // Add your mood trends chart or data here
        Container(
          height: 200,
          color: Colors.blue.withOpacity(0.1),
          child: Center(
            child: Text('Mood Trends Chart Placeholder'),
          ),
        ),
      ],
    );
  }
}