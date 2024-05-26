import 'chapter_model.dart';
import 'package:flutter/material.dart';

class SubjectModel {
  final String title;
  final Color color;
  final Map<String, ChapterModel> chapters;

  SubjectModel({
    required this.title,
    required this.color,
    required this.chapters,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      title: json['title'],
      color: Color(
          int.parse(json['color'].substring(1, 7), radix: 16) + 0xFF000000),
      chapters: (json['chapters'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, ChapterModel.fromJson(value)),
      ),
    );
  }
}
