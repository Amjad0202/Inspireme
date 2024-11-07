// lib/features/journal/screens/journal_editor_screen.dart
import 'package:flutter/material.dart';

class JournalEditorScreen extends StatefulWidget {
  final JournalEntry? entry;

  const JournalEditorScreen({this.entry});

  @override
  _JournalEditorScreenState createState() => _JournalEditorScreenState();
}

class _JournalEditorScreenState extends State<JournalEditorScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  String _selectedMood = '';
  List<String> _selectedTags = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.entry?.title ?? '');
    _contentController = TextEditingController(text: widget.entry?.content ?? '');
    if (widget.entry != null) {
      _selectedMood = widget.entry!.mood;
      _selectedTags = List.from(widget.entry!.tags);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entry == null ? 'New Entry' : 'Edit Entry'),
        actions: [
          IconButton(
            icon: Icon(Icons.mood),
            onPressed: _showMoodSelector,
          ),
          IconButton(
            icon: Icon(Icons.local_offer),
            onPressed: _showTagSelector,
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveEntry,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  hintText: 'Write your thoughts...',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
            if (_selectedMood.isNotEmpty)
              Chip(
                label: Text(_selectedMood),
                onDeleted: () => setState(() => _selectedMood = ''),
              ),
            Wrap(
              spacing: 8,
              children: _selectedTags.map((tag) => Chip(
                label: Text(tag),
                onDeleted: () => setState(() => _selectedTags.remove(tag)),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _showMoodSelector() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.sentiment_very_satisfied),
            title: Text('Happy'),
            onTap: () => _selectMood('Happy'),
          ),
          ListTile(
            leading: Icon(Icons.sentiment_neutral),
            title: Text('Neutral'),
            onTap: () => _selectMood('Neutral'),
          ),
          ListTile(
            leading: Icon(Icons.sentiment_dissatisfied),
            title: Text('Sad'),
            onTap: () => _selectMood('Sad'),
          ),
        ],
      ),
    );
  }

  void _selectMood(String mood) {
    setState(() => _selectedMood = mood);
    Navigator.pop(context);
  }

  void _showTagSelector() {
    final TextEditingController tagController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Tag'),
        content: TextField(
          controller: tagController,
          decoration: InputDecoration(hintText: 'Enter tag'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (tagController.text.isNotEmpty) {
                setState(() => _selectedTags.add(tagController.text));
                Navigator.pop(context);
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  Future<void> _saveEntry() async {
    // TODO: Implement save to repository
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}