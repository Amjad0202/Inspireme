// lib/features/journal/widgets/journal_entry_card.dart
class JournalEntryCard extends StatelessWidget {
  final JournalEntry entry;
  final VoidCallback onTap;

  const JournalEntryCard({
    required this.entry,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entry.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8),
              Text(
                entry.content.length > 100 
                    ? '${entry.content.substring(0, 100)}...'
                    : entry.content,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.access_time, size: 16),
                  SizedBox(width: 4),
                  Text(
                    _formatDate(entry.createdAt),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  if (entry.mood.isNotEmpty) ...[
                    SizedBox(width: 8),
                    Icon(Icons.mood, size: 16),
                    SizedBox(width: 4),
                    Text(
                      entry.mood,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}