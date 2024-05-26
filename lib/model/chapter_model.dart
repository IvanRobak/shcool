import 'topic_model.dart';

class ChapterModel {
  final Map<String, TopicModel> topics;

  ChapterModel({
    required this.topics,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      topics: (json['topics'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, TopicModel.fromJson(value)),
      ),
    );
  }
}
