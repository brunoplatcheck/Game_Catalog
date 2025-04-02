import 'package:flutter/material.dart';
import 'constants.dart'; // Importe as constantes

class AppTheme {
  // Tema claro
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue, // Cor primária
    fontFamily: 'Roboto', // Fonte padrão
    scaffoldBackgroundColor: AppConstants.backgroundColor, // Cor de fundo
    textTheme: TextTheme(
      titleLarge: TextStyle( // Substitui headline6
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle( // Substitui bodyText1
        fontSize: 16,
        color: Colors.black87,
      ),
      bodyMedium: TextStyle( // Substitui bodyText2
        fontSize: 14,
        color: Colors.grey[800],
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppConstants.primaryColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppConstants.secondaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Tema escuro (opcional)
  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: Colors.grey[900], // Fundo escuro
    textTheme: TextTheme(
      titleLarge: TextStyle( // Substitui headline6
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle( // Substitui bodyText1
        fontSize: 16,
        color: Colors.white,
      ),
      bodyMedium: TextStyle( // Substitui bodyText2
        fontSize: 14,
        color: Colors.grey[300],
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey[800],
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueGrey[600],
      textTheme: ButtonTextTheme.primary,
    ),
  );
}