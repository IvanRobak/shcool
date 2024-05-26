import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shcool/model/topic_model.dart';
import 'package:shcool/model/class_model.dart';
import 'package:flutter/foundation.dart'; // для debugPrint

class DataService {
  Future<List<ClassModel>> loadClasses() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/classes.json');
      final data = json.decode(response);
      final List<ClassModel> classes = [];

      (data['classes'] as Map<String, dynamic>).forEach((key, value) {
        debugPrint('Class key: $key, value: $value');
        classes.add(ClassModel.fromJson(key, value));
      });

      return classes;
    } catch (e) {
      debugPrint('Error loading classes: $e');
      throw Exception('Error loading classes: $e');
    }
  }

  Future<List<TopicModel>> loadTopics(
      String classId, String subjectId, String chapterId) async {
    String classId = 'class1'; // Приклад значення classId
    String subjectId = 'math'; // Приклад значення subjectId
    String chapterId = 'figures'; // Приклад значення chapterId

    print('classId: $classId, subjectId: $subjectId, chapterId: $chapterId');
    try {
      final String response =
          await rootBundle.loadString('assets/data/classes.json');
      final data = json.decode(response);

      final classData = data['classes'][classId];
      if (classData == null) {
        throw Exception('Class not found');
      }

      final subjectData = classData['subjects'][subjectId];
      if (subjectData == null) {
        throw Exception('Subject not found');
      }

      final chapterData = subjectData['chapters'][chapterId];
      if (chapterData == null) {
        throw Exception('Chapter not found');
      }

      final topicsData = chapterData['topics'];
      if (topicsData == null) {
        throw Exception('Topics not found');
      }

      final List<TopicModel> topics = [];

      (topicsData as Map<String, dynamic>).forEach((key, value) {
        topics.add(TopicModel.fromJson(value));
      });

      return topics;
    } catch (e) {
      debugPrint('Error loading topics: $e');
      throw Exception('Error loading topics: $e');
    }
  }
}
