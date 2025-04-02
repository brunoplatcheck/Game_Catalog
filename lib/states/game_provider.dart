import 'package:flutter/material.dart';
import '../repositories/game_repository.dart';
import '../models/game_model.dart';

class GameProvider with ChangeNotifier {
  final GameRepository _gameRepository = GameRepository();
  List<Game> _games = [];
  bool _isLoading = false;

  List<Game> get games => _games;
  bool get isLoading => _isLoading;

  // Buscar lista de jogos
  Future<void> fetchGames() async {
    _isLoading = true;
    notifyListeners();

    try {
      _games = await _gameRepository.fetchGames();
    } catch (error) {
      print('Erro ao buscar jogos: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Buscar detalhes de um jogo
  Future<Game> fetchGameDetails(int gameId) async {
    try {
      return await _gameRepository.fetchGameDetails(gameId);
    } catch (error) {
      print('Erro ao buscar detalhes do jogo: $error');
      throw error;
    }
  }
}