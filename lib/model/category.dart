import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final Color color;
}

class CardModel {
  CardModel({required this.image, required this.options});

  final String image;
  final List<String> options;
}
