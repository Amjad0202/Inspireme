// lib/data/models/quote_model.dart
class Quote {
  final String id;
  final String content;
  final String author;
  final List<String> categories;
  final DateTime datePosted;
  final int likes;

  Quote({
    required this.id,
    required this.content, 
    required this.author,
    required this.categories,
    required this.datePosted,
    this.likes = 0,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      content: json['content'],
      author: json['author'],
      categories: List<String>.from(json['categories']),
      datePosted: DateTime.parse(json['datePosted']),
      likes: json['likes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'author': author,
    'categories': categories,
    'datePosted': datePosted.toIso8601String(),
    'likes': likes,
  };
}