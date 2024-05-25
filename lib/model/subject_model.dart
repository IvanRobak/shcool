import 'package:flutter/material.dart';

class SubjectModel {
  final String id;
  final String title;
  final Color color;
  final List<String> options;
  final String correctOption;
  final bool isFavorite;

  SubjectModel({
    required this.id,
    required this.title,
    required this.color,
    required this.options,
    required this.correctOption,
    required this.isFavorite,
  });

  factory SubjectModel.fromJson(String id, Map<String, dynamic> json) {
    return SubjectModel(
      id: id,
      title: json['title'] ?? 'Unknown Title',
      color: Color(
          int.parse(json['color'].substring(1, 7), radix: 16) + 0xFF000000),
      options: List<String>.from(json['options']),
      correctOption: json['correctOption'],
      isFavorite: json['isFavorite'],
    );
  }
}
