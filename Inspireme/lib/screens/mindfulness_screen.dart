import 'package:flutter/material.dart';

class MindfulnessScreen extends StatelessWidget {
  const MindfulnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mindfulness'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today\'s Mindfulness Activities',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildMeditationCard(),
            const SizedBox(height: 16),
            _buildBreathingCard(),
            const SizedBox(height: 16),
            _buildJournalingCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildMeditationCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.self_improvement, size: 32),
                SizedBox(width: 16),
                Text(
                  'Guided Meditation',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Take a moment to center yourself with guided meditation'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement meditation session
              },
              child: const Text('Start 10-min Session'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreathingCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.air, size: 32),
                SizedBox(width: 16),
                Text(
                  'Breathing Exercise',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Practice deep breathing for stress relief'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement breathing exercise
              },
              child: const Text('Start Breathing Exercise'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJournalingCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.book, size: 32),
                SizedBox(width: 16),
                Text(
                  'Daily Journal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('What are you grateful for today?'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement journaling
              },
              child: const Text('Open Journal'),
            ),
          ],
        ),
      ),
    );
  }
}