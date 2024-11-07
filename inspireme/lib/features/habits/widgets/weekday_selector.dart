// lib/features/habits/widgets/weekday_selector.dart
import 'package:flutter/material.dart';

class WeekdaySelector extends StatelessWidget {
  final List<String> selectedDays;
  final Function(List<String>) onChanged;

  const WeekdaySelector({
    Key? key,
    required this.selectedDays,
    required this.onChanged,
  }) : super(key: key);

  static const List<String> _weekdays = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: _weekdays.map((day) {
        final isSelected = selectedDays.contains(day);
        return FilterChip(
          label: Text(day),
          selected: isSelected,
          onSelected: (selected) {
            final updatedDays = List<String>.from(selectedDays);
            if (selected) {
              updatedDays.add(day);
            } else {
              updatedDays.remove(day);
            }
            onChanged(updatedDays);
          },
          selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
          checkmarkColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            color: isSelected 
                ? Theme.of(context).primaryColor
                : Theme.of(context).textTheme.bodyMedium?.color,
          ),
          semanticLabel: 'Select ${day}day',
        );
      }).toList(),
    );
  }
}