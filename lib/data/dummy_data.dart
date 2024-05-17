import 'package:flutter/material.dart';
import 'package:shcool/model/card.dart';
import 'package:shcool/model/category.dart';

const availableCategories = [
  Category(
    id: 'c1',
    title: '1',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: '2',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: '3',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: '4',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: '5',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: '6',
    color: Colors.green,
  ),
];

const availableSubjects = [
  Category(
    id: 'c1',
    title: 'Математика',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Українська мова',
    color: Colors.purple,
  ),
  Category(
    id: 'c3',
    title: 'Історія',
    color: Colors.purple,
  ),
  Category(
    id: 'c4',
    title: 'Природа',
    color: Colors.purple,
  ),
  Category(
    id: 'c5',
    title: 'Основи здоровʼя',
    color: Colors.purple,
  ),
  Category(
    id: 'c6',
    title: 'Англійська',
    color: Colors.purple,
  ),
];

const availableChapters = [
  Category(
    id: 'c1',
    title: 'Числа',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Фігури',
    color: Colors.purple,
  ),
  Category(
    id: 'c3',
    title: 'Вимірювання',
    color: Colors.purple,
  ),
];

class StudyItemData {
  static const List<Map<String, String>> items = [
    {'imagePath': 'assets/images/circle.png', 'title': 'Круг'},
    {'imagePath': 'assets/images/triangle.png', 'title': 'Трикутник'},
    {'imagePath': 'assets/images/rectangle.png', 'title': 'Прямокутник'},
    {'imagePath': 'assets/images/square.png', 'title': 'Квадрат'},
  ];
}

List<CardModel> cards = [
  CardModel(
    id: 'c1',
    imagePath: 'assets/images/circle.png',
    title: 'Круг',
    description:
        'Трикутник - це геометрична фігура з трьома сторонами та трьома кутами.',
    options: ['Трикутник', 'Квадрат', 'Круг', 'Прямокутник'],
    isFavorite: false,
  ),
  CardModel(
    id: 'c2',
    imagePath: 'assets/images/triangle.png',
    title: 'Трикутник',
    description:
        'Трикутник - це геометрична фігура з трьома сторонами та трьома кутами.',
    options: ['Квадрат', 'Прямокутник', 'Круг', 'Трикутник'],
    isFavorite: false,
  ),
  CardModel(
    id: 'c3',
    imagePath: 'assets/images/square.png',
    title: 'Квадрат',
    description:
        'Трикутник - це геометрична фігура з трьома сторонами та трьома кутами.',
    options: ['Прямокутник', 'Квадрат', 'Круг', 'Трикутник'],
    isFavorite: false,
  ),
  CardModel(
    id: 'c4',
    imagePath: 'assets/images/rectangle.png',
    title: 'Прямокутник',
    description:
        'Трикутник - це геометрична фігура з трьома сторонами та трьома кутами.',
    options: ['Круг', 'Прямокутник', 'Квадрат', 'Трикутник'],
    isFavorite: false,
  ),
  // Додайте інші картки за потребою
];
