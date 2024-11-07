// lib/data/repositories/quote_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class QuoteRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Quote>> getQuotes({String? category}) async {
    try {
      var query = _firestore.collection('quotes');
      if (category != null) {
        query = query.where('categories', arrayContains: category);
      }
      
      final snapshot = await query.get();
      return snapshot.docs
          .map((doc) => Quote.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching quotes: $e');
      return [];
    }
  }

  Future<Quote?> getDailyQuote() async {
    try {
      final snapshot = await _firestore
          .collection('quotes')
          .orderBy('datePosted', descending: true)
          .limit(1)
          .get();
      
      if (snapshot.docs.isNotEmpty) {
        return Quote.fromJson(snapshot.docs.first.data());
      }
      return null;
    } catch (e) {
      print('Error fetching daily quote: $e');
      return null;
    }
  }

  Future<void> likeQuote(String quoteId) async {
    await _firestore.collection('quotes')
        .doc(quoteId)
        .update({'likes': FieldValue.increment(1)});
  }
}