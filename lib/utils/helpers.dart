class Helpers {
  // Formatar data (ex: 2023-10-01 para 01/10/2023)
  static String formatDate(String date) {
    final parsedDate = DateTime.parse(date);
    return '${parsedDate.day}/${parsedDate.month}/${parsedDate.year}';
  }

  // Validar e-mail
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  // Validar senha
  static bool isValidPassword(String password) {
    return password.length >= 6;
  }
}