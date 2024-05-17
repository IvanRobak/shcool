class CardModel {
  CardModel({
    required this.imagePath,
    required this.title,
    required this.isFavorite,
    required this.options,
    required this.id,
    required this.description,
  });
  final String id;
  final String imagePath;
  final String title;
  final bool isFavorite;
  final List<String> options;
  final String description;
}
