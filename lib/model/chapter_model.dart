import 'topic_model.dart';

class ChapterModel {
  final String id;
  final String title;
  final Map<String, TopicModel> topics;

  ChapterModel({
    required this.id,
    required this.title,
    required this.topics,
  });

  factory ChapterModel.fromJson(String id, Map<String, dynamic> json) {
    return ChapterModel(
      id: id,
      title: json['title'] ?? 'Unknown Title',
      topics: (json['topics'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, TopicModel.fromJson(key, value)),
      ),
    );
  }
}
