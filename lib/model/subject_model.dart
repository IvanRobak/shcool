import 'chapter_model.dart';
import 'package:flutter/material.dart';

class SubjectModel {
  final String id; // Додано поле id
  final String title;
  final Color color;
  final Map<String, ChapterModel> chapters;

  SubjectModel({
    required this.id,
    required this.title,
    required this.color,
    required this.chapters,
  });

  factory SubjectModel.fromJson(String id, Map<String, dynamic> json) {
    return SubjectModel(
      id: id,
      title: json['title'],
      color: Color(
          int.parse(json['color'].substring(1, 7), radix: 16) + 0xFF000000),
      chapters: (json['chapters'] as Map<String, dynamic>).map(
        (chapterId, chapterJson) =>
            MapEntry(chapterId, ChapterModel.fromJson(chapterId, chapterJson)),
      ),
    );
  }
}
