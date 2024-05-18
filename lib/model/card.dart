class CardModel {
  final String id;
  final String imagePath;
  final String title;
  final String description;
  final List<String> options;
  final bool isFavorite;

  CardModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.options,
    required this.isFavorite,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'],
      imagePath: json['imagePath'],
      title: json['title'],
      description: json['description'],
      options: List<String>.from(json['options']),
      isFavorite: json['isFavorite'],
    );
  }
}
