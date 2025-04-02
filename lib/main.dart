import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'states/game_provider.dart';
import 'states/review_provider.dart';
import 'views/home_screen.dart';
import 'utils/theme.dart'; // Importe o tema
import 'utils/constants.dart'; // Importe as constantes

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
        ChangeNotifierProvider(create: (_) => ReviewProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle, // Use a constante
      theme: AppTheme.lightTheme, // Use o tema personalizado
      home: HomeScreen(),
    );
  }
}