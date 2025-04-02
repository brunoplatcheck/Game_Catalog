class Game {
  final int id;
  final String name;
  final String released;
  final String backgroundImage;
  final double rating;
  final String description; // 🔹 Adicionado

  Game({
    required this.id,
    required this.name,
    required this.released,
    required this.backgroundImage,
    required this.rating,
    required this.description, // 🔹 Adicionado
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] ?? 0, // Valor padrão caso o campo não exista
      name: json['name'] ?? 'Sem nome', // Valor padrão
      released: json['released'] ?? 'Data desconhecida', // Valor padrão
      backgroundImage: json['background_image'] ?? '', // Valor padrão
      rating: (json['rating'] ?? 0.0).toDouble(), // Valor padrão
      description: json['description'] ?? 'Descrição não disponível', // 🔹 Evita valores nulos
    );
  }

  // Método para converter o objeto Game em JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'released': released,
      'background_image': backgroundImage,
      'rating': rating,
      'description': description, // 🔹 Incluído
    };
  }
}
