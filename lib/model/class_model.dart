import 'package:flutter/material.dart';
import 'package:shcool/model/subject_model.dart';

class ClassModel {
  final String id; // Додаємо поле id
  final Color color;
  final String title;
  final Map<String, SubjectModel> subjects;

  ClassModel({
    required this.id, // Ініціалізуємо поле id
    required this.color,
    required this.title,
    required this.subjects,
  });

  factory ClassModel.fromJson(String id, Map<String, dynamic> json) {
    final colorHex = json['color'] as String;
    return ClassModel(
      id: id, // Присвоюємо id
      color: Color(int.parse(colorHex.replaceFirst('#', '0xff'))),
      title: json['title'] as String,
      subjects: (json['subjects'] as Map<String, dynamic>).map(
        (subjectId, subjectJson) =>
            MapEntry(subjectId, SubjectModel.fromJson(subjectId, subjectJson)),
      ),
    );
  }
}
