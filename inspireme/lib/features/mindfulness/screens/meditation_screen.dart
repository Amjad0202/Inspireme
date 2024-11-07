// lib/features/mindfulness/screens/meditation_screen.dart
import 'package:flutter/material.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  int _remainingTime = 0;
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meditation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${(_remainingTime / 60).floor()}:${(_remainingTime % 60).toString().padLeft(2, '0')}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: _toggleTimer,
                  iconSize: 48,
                ),
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed: _stopTimer,
                  iconSize: 48,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _toggleTimer() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _stopTimer() {
    setState(() {
      _isPlaying = false;
      _remainingTime = 0;
    });
  }
}