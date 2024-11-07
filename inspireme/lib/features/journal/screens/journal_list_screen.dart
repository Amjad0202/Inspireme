// lib/features/journal/screens/journal_list_screen.dart
import 'package:flutter/material.dart';

class JournalListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Journal'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return JournalEntryCard(
            entry: entries[index],
            onTap: () => _openEntry(context, entries[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _createNewEntry(context),
      ),
    );
  }
}