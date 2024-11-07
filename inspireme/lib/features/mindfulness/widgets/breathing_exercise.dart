// lib/features/mindfulness/widgets/breathing_exercise.dart
import 'package:flutter/material.dart';

class BreathingExercise extends StatefulWidget {
  const BreathingExercise({super.key});

  @override
  _BreathingExerciseState createState() => _BreathingExerciseState();
}

class _BreathingExerciseState extends State<BreathingExercise>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat(reverse: true);
    
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 200 * _animation.value,
          height: 200 * _animation.value,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.withOpacity(0.3),
          ),
          child: Center(
            child: Text(
              _controller.status == AnimationStatus.forward 
                  ? 'Inhale' 
                  : 'Exhale',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}