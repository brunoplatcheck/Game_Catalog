import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/game_provider.dart';
import '../models/game_model.dart';
import 'game_detail_screen.dart';
import '../utils/constants.dart'; // Importe as constantes

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    if (gameProvider.games.isEmpty && !gameProvider.isLoading) {
      gameProvider.fetchGames();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appTitle), // Use a constante
      ),
      body: gameProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: gameProvider.games.length,
        itemBuilder: (context, index) {
          final game = gameProvider.games[index];
          return ListTile(
            leading: Image.network(game.backgroundImage),
            title: Text(game.name),
            subtitle: Text('Lançamento: ${game.released}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameDetailScreen(gameId: game.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}