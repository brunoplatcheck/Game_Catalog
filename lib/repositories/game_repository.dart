import '../services/api_service.dart';
import '../models/game_model.dart';

class GameRepository {
  final ApiService _apiService = ApiService();

  // Buscar lista de jogos
  Future<List<Game>> fetchGames() async {
    try {
      final gamesData = await _apiService.fetchGames();
      return gamesData.map((gameJson) => Game.fromJson(gameJson)).toList();
    } catch (error) {
      throw Exception('Erro ao buscar jogos: $error');
    }
  }

  // Buscar detalhes de um jogo
  Future<Game> fetchGameDetails(int gameId) async {
    try {
      final gameDetails = await _apiService.fetchGameDetails(gameId);
      return Game.fromJson(gameDetails);
    } catch (error) {
      throw Exception('Erro ao buscar detalhes do jogo: $error');
    }
  }
}