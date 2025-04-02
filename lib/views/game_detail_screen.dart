import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/game_provider.dart';
import '../states/review_provider.dart';
import '../models/game_model.dart';
import 'review_screen.dart';
import '../utils/constants.dart'; // Importe as constantes
import '../utils/helpers.dart'; // Importe as funções auxiliares

class GameDetailScreen extends StatelessWidget {
  final int gameId;

  GameDetailScreen({required this.gameId});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    final reviewProvider = Provider.of<ReviewProvider>(context);

    if (reviewProvider.reviews.isEmpty && !reviewProvider.isLoading) {
      reviewProvider.fetchReviews(gameId.toString());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Jogo'),
      ),
      body: FutureBuilder<Game>(
        future: gameProvider.fetchGameDetails(gameId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(AppConstants.errorText)); // Use a constante
          } else if (!snapshot.hasData) {
            return Center(child: Text('Nenhum detalhe encontrado'));
          } else {
            final game = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(game.backgroundImage),
                  SizedBox(height: 16),
                  Text(
                    game.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Lançamento: ${Helpers.formatDate(game.released)}'), // Use a função auxiliar
                  SizedBox(height: 8),
                  Text('Avaliação: ${game.rating}'),
                  SizedBox(height: 16),
                  Text(
                    'Descrição:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(game.description),
                  SizedBox(height: 16),
                  Text(
                    'Avaliações dos Usuários:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  reviewProvider.isLoading
                      ? CircularProgressIndicator()
                      : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: reviewProvider.reviews.length,
                    itemBuilder: (context, index) {
                      final review = reviewProvider.reviews[index];
                      return ListTile(
                        title: Text('Avaliação: ${review.rating}'),
                        subtitle: Text(review.comment),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReviewScreen(gameId: gameId),
                        ),
                      );
                    },
                    child: Text('Avaliar Jogo'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}