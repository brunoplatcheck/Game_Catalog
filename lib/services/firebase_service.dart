import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Salvar avaliação
  Future<void> saveReview(String gameId, String userId, double rating, String comment) async {
    await _firestore
        .collection('reviews')
        .doc(gameId)
        .collection('user_reviews')
        .doc(userId)
        .set({
      'rating': rating,
      'comment': comment,
      'timestamp': DateTime.now(),
    });
  }

  // Buscar avaliações de um jogo
  Future<List<Map<String, dynamic>>> getReviews(String gameId) async {
    final snapshot = await _firestore
        .collection('reviews')
        .doc(gameId)
        .collection('user_reviews')
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}