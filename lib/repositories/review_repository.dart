import '../services/firebase_service.dart';
import '../models/review_model.dart';

class ReviewRepository {
  final FirebaseService _firebaseService = FirebaseService();

  // Buscar avaliações de um jogo
  Future<List<Review>> fetchReviews(String gameId) async {
    try {
      final reviewsData = await _firebaseService.getReviews(gameId);
      return reviewsData.map((reviewJson) => Review.fromJson(reviewJson)).toList();
    } catch (error) {
      throw Exception('Erro ao buscar avaliações: $error');
    }
  }

  // Adicionar uma avaliação
  Future<void> addReview(String gameId, double rating, String comment) async {
    try {
      await _firebaseService.saveReview(gameId, 'user_id', rating, comment);
    } catch (error) {
      throw Exception('Erro ao salvar avaliação: $error');
    }
  }
}