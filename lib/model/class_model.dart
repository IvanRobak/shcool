import 'package:flutter/material.dart';
import 'package:shcool/model/subject_model.dart';

class ClassModel {
  final String id;
  final String title;
  final Color color;
  final Map<String, SubjectModel> subjects;

  ClassModel({
    required this.id,
    required this.title,
    required this.color,
    required this.subjects,
  });

  factory ClassModel.fromJson(String id, Map<String, dynamic> json) {
    return ClassModel(
      id: id,
      title: json['title'],
      color: Color(
          int.parse(json['color'].substring(1, 7), radix: 16) + 0xFF000000),
      subjects: (json['subjects'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, SubjectModel.fromJson(key, value)),
      ),
    );
  }
}
