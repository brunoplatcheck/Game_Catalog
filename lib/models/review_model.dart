class Review {
  final String userId;
  final double rating;
  final String comment;
  final DateTime timestamp;

  Review({
    required this.userId,
    required this.rating,
    required this.comment,
    required this.timestamp,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      userId: json['userId'] ?? '', // Valor padrão
      rating: json['rating']?.toDouble() ?? 0.0, // Valor padrão
      comment: json['comment'] ?? '', // Valor padrão
      timestamp: json['timestamp']?.toDate() ?? DateTime.now(), // Valor padrão
    );
  }

  // Método para converter o objeto Review em JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'rating': rating,
      'comment': comment,
      'timestamp': timestamp,
    };
  }
}