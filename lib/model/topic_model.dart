// models/topic_model.dart
class TopicModel {
  final String id;
  final String imagePath;
  final String title;
  final String description;
  final List<String> options;
  final String correctOption;
  final bool isFavorite;

  TopicModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.options,
    required this.correctOption,
    required this.isFavorite,
  });

  factory TopicModel.fromJson(String id, Map<String, dynamic> json) {
    return TopicModel(
      id: id,
      imagePath: json['imagePath'],
      title: json['title'],
      description: json['description'],
      options: List<String>.from(json['options']),
      correctOption: json['correctOption'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
