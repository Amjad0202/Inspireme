// lib/features/quotes/widgets/quote_card.dart
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function() onLike;
  final Function() onShare;

  const QuoteCard({
    Key? key,
    required this.quote,
    required this.onLike,
    required this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quote.content,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              '- ${quote.author}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: onLike,
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: onShare,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}