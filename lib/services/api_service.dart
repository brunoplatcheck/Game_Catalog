import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart'; // Importe as constantes

class ApiService {
  // Método para buscar a lista de jogos
  Future<List<dynamic>> fetchGames() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.baseUrl}/games?key=${AppConstants.apiKey}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['results']; // Retorna a lista de jogos
      } else {
        throw Exception('Falha ao carregar jogos: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Erro na requisição: $error');
    }
  }

  // Método para buscar detalhes de um jogo específico
  Future<Map<String, dynamic>> fetchGameDetails(int gameId) async {
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.baseUrl}/games/$gameId?key=${AppConstants.apiKey}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data; // Retorna os detalhes do jogo
      } else {
        throw Exception('Falha ao carregar detalhes do jogo: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Erro na requisição: $error');
    }
  }
}