import 'package:flutter/material.dart';
import '../repositories/review_repository.dart';
import '../models/review_model.dart';

class ReviewProvider with ChangeNotifier {
  final ReviewRepository _reviewRepository = ReviewRepository();
  List<Review> _reviews = [];
  bool _isLoading = false;

  List<Review> get reviews => _reviews;
  bool get isLoading => _isLoading;

  // Buscar avaliações de um jogo
  Future<void> fetchReviews(String gameId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _reviews = await _reviewRepository.fetchReviews(gameId);
    } catch (error) {
      print('Erro ao buscar avaliações: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Adicionar uma avaliação
  Future<void> addReview(String gameId, double rating, String comment) async {
    try {
      await _reviewRepository.addReview(gameId, rating, comment);
      notifyListeners();
    } catch (error) {
      print('Erro ao salvar avaliação: $error');
    }
  }
}