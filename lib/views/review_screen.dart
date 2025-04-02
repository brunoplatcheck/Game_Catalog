import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/review_provider.dart';

class ReviewScreen extends StatefulWidget {
  final int gameId;

  ReviewScreen({required this.gameId});

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  double _rating = 0;
  String _comment = '';

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliar Jogo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Avaliação:'),
              Slider(
                value: _rating,
                min: 0,
                max: 5,
                divisions: 5,
                label: _rating.toString(),
                onChanged: (value) {
                  setState(() {
                    _rating = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Comentário'),
                onChanged: (value) {
                  _comment = value;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await reviewProvider.addReview(
                      widget.gameId.toString(),
                      _rating,
                      _comment,
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text('Enviar Avaliação'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}