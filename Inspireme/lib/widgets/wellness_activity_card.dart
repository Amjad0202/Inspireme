// lib/widgets/wellness_activity_card.dart
import 'package:flutter/material.dart';
import 'package:inspire/models/wellness_activity.dart';

class WellnessActivityCard extends StatelessWidget {
  final WellnessActivity activity;
  final VoidCallback onTap;
  final Function(bool?) onComplete;

  const WellnessActivityCard({
    super.key,
    required this.activity,
    required this.onTap,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _getTypeColor(activity.type).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getActivityIcon(activity.type),
                      color: _getTypeColor(activity.type),
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activity.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${activity.durationMinutes} minutes • ${activity.type}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      value: activity.completed,
                      onChanged: onComplete,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
              if (activity.description.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  activity.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: activity.completed ? 1.0 : 0.0,
                backgroundColor: Colors.grey.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getTypeColor(activity.type),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'meditation':
        return Colors.purple;
      case 'exercise':
        return Colors.green;
      case 'journaling':
        return Colors.blue;
      default:
        return Colors.grey;
    }
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