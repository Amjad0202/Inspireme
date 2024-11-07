// lib/features/habits/screens/habit_form_screen.dart
import 'package:flutter/material.dart';

class HabitFormScreen extends StatefulWidget {
  final Habit? habit;

  const HabitFormScreen({this.habit});

  @override
  _HabitFormScreenState createState() => _HabitFormScreenState();
}

class _HabitFormScreenState extends State<HabitFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  List<String> _selectedDays = [];
  TimeOfDay _reminderTime = TimeOfDay.now();
  Color _selectedColor = Colors.blue;
  String _selectedIcon = '0xe87d'; // default icon

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.habit?.title);
    _descriptionController = TextEditingController(text: widget.habit?.description);
    if (widget.habit != null) {
      _selectedDays = widget.habit!.frequency;
      _reminderTime = widget.habit!.reminderTime;
      _selectedColor = widget.habit!.color;
      _selectedIcon = widget.habit!.icon;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habit == null ? 'Create Habit' : 'Edit Habit'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _saveHabit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Habit Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a habit name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16),
              Text('Frequency', style: Theme.of(context).textTheme.titleMedium),
              WeekdaySelector(
                selectedDays: _selectedDays,
                onChanged: (days) => setState(() => _selectedDays = days),
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text('Reminder Time'),
                trailing: Text(_reminderTime.format(context)),
                onTap: _selectTime,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text('Color'),
                      trailing: CircleAvatar(backgroundColor: _selectedColor),
                      onTap: _selectColor,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text('Icon'),
                      trailing: Icon(IconData(
                        int.parse(_selectedIcon),
                        fontFamily: 'MaterialIcons',
                      )),
                      onTap: _selectIcon,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: _reminderTime,
    );
    if (time != null) {
      setState(() => _reminderTime = time);
    }
  }

  void _selectColor() {
    showDialog(
      context: context,
      builder: (context) => ColorPicker(
        selectedColor: _selectedColor,
        onColorSelected: (color) {
          setState(() => _selectedColor = color);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _selectIcon() {
    showDialog(
      context: context,
      builder: (context) => IconPicker(
        selectedIcon: _selectedIcon,
        onIconSelected: (icon) {
          setState(() => _selectedIcon = icon);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _saveHabit() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Save habit to repository
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}