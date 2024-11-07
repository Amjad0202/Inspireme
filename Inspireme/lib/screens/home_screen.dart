// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/daily_quote_widget.dart';
import '../widgets/wellness_tracker_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to InspireMe'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WellnessCard(),
            SizedBox(height: 20),
            DailyQuoteCard(),
            SizedBox(height: 20),
            MindfulnessReminder(),
            SizedBox(height: 20),
            LifestyleTipsCard(),
          ],
        ),
      ),
    );
  }
}

class WellnessCard extends StatelessWidget {
  const WellnessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wellness Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(value: 0.7),
            SizedBox(height: 10),
            Text('You\'re doing great! Keep up the good work.'),
          ],
        ),
      ),
    );
  }
}




class DailyQuoteCard extends StatelessWidget {
  const DailyQuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Daily Quote',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '"The only way to do great work is to love what you do."',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text('- Steve Jobs'),
          ],
        ),
      ),
    );
  }
}

class MindfulnessReminder extends StatelessWidget {
  const MindfulnessReminder({super.key});

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
              'Mindfulness Reminder',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text('Take a deep breath and be present in the moment.'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Start mindfulness session
              },
              child: const Text('Start 5-min Session'),
            ),
          ],
        ),
      ),
    );
  }
}

class LifestyleTipsCard extends StatelessWidget {
  const LifestyleTipsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lifestyle Improvement Tips',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('1. Stay hydrated and drink plenty of water.'),
            SizedBox(height: 5),
            Text('2. Get at least 8 hours of sleep every night.'),
            SizedBox(height: 5),
            Text('3. Exercise regularly to maintain physical health.'),
            SizedBox(height: 5),
            Text('4. Take breaks and practice mindfulness.'),
          ],
        ),
      ),
    );
  }
}