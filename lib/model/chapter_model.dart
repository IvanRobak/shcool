import 'package:flutter/services.dart';

import 'topic_model.dart';

class ChapterModel {
  final String id;
  final String title;
  final Color color;
  final Map<String, TopicModel> topics;

  ChapterModel(
      {required this.topics,
      required this.color,
      required this.title,
      required this.id});

  factory ChapterModel.fromJson(String id, Map<String, dynamic> json) {
    return ChapterModel(
      id: id,
      title: json['title'],
      color: Color(
          int.parse(json['color'].substring(1, 7), radix: 16) + 0xFF000000),
      topics: (json['topics'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, TopicModel.fromJson(value)),
      ),
    );
  }
}
