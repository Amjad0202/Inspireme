// lib/screens/mindfulness_screen.dart
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class MindfulnessScreen extends StatefulWidget {
  const MindfulnessScreen({super.key});

  @override
  State<MindfulnessScreen> createState() => _MindfulnessScreenState();
}

class _MindfulnessScreenState extends State<MindfulnessScreen> with SingleTickerProviderStateMixin {
  final CountDownController _timerController = CountDownController();
  late AnimationController _breathingController;
  bool _isBreathing = false;

  @override
  void initState() {
    super.initState();
    _breathingController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mindfulness'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
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

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Mindfulness',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Take a moment to focus on your well-being',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildMeditationCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(Icons.self_improvement, size: 32),
                SizedBox(width: 16),
                Text(
                  'Guided Meditation',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CircularCountDownTimer(
              duration: 600,
              initialDuration: 0,
              controller: _timerController,
              width: 200,
              height: 200,
              ringColor: Colors.grey[300]!,
              fillColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.white,
              strokeWidth: 15.0,
              textStyle: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              isReverse: true,
              onComplete: () {
                // Show completion dialog
                _showCompletionDialog('Meditation');
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _timerController.start(),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _timerController.pause(),
                  icon: const Icon(Icons.pause),
                  label: const Text('Pause'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _timerController.reset(),
                  icon: const Icon(Icons.replay),
                  label: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreathingCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(Icons.air, size: 32),
                SizedBox(width: 16),
                Text(
                  'Breathing Exercise',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AnimatedBuilder(
              animation: _breathingController,
              builder: (context, child) {
                return Container(
                  width: 200 * (_breathingController.value + 0.5),
                  height: 200 * (_breathingController.value + 0.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                  ),
                  child: Center(
                    child: Text(
                      _isBreathing ? 'Exhale...' : 'Inhale...',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _toggleBreathing,
              icon: Icon(_isBreathing ? Icons.stop : Icons.play_arrow),
              label: Text(_isBreathing ? 'Stop' : 'Start Breathing'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJournalingCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(Icons.book, size: 32),
                SizedBox(width: 16),
                Text(
                  'Journaling',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to journaling screen or show journaling dialog
              },
              icon: const Icon(Icons.edit),
              label: const Text('Start Journaling'),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleBreathing() {
    setState(() {
      _isBreathing = !_isBreathing;
      if (_isBreathing) {
        _breathingController.repeat(reverse: true);
      } else {
        _breathingController.stop();
      }
    });
  }

  void _showCompletionDialog(String activity) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$activity Complete'),
        content: Text('Great job completing your $activity session!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _breathingController.dispose();
    super.dispose();
  }
}