class SubjectModel {
  final String id;
  final String title;
  final List<String> options;
  final String correctOption;
  final bool isFavorite;

  SubjectModel({
    required this.id,
    required this.title,
    required this.options,
    required this.correctOption,
    required this.isFavorite,
  });

  factory SubjectModel.fromJson(String id, Map<String, dynamic> json) {
    return SubjectModel(
      id: id,
      title: json['title'] ?? 'Unknown Title',
      options: List<String>.from(json['options']),
      correctOption: json['correctOption'],
      isFavorite: json['isFavorite'],
    );
  }
}
