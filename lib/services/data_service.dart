import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shcool/model/topic_model.dart';
import 'package:shcool/model/class_model.dart'; // для debugPrint

class DataService {
  Future<List<ClassModel>> loadClasses() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/classes.json');
      final data = json.decode(response);
      final List<ClassModel> classes = [];

      (data['classes'] as Map<String, dynamic>).forEach((key, value) {
        classes.add(ClassModel.fromJson(key, value));
      });

      return classes;
    } catch (e) {
      throw Exception('Error loading classes: $e');
    }
  }

  Future<List<TopicModel>> loadTopics(
      String classId, String subjectId, String chapterId) async {
    final String response =
        await rootBundle.loadString('assets/data/classes.json');
    final data = json.decode(response);

    final classData = data['classes'][classId];

    final subjectData = classData['subjects'][subjectId];

    final chapterData = subjectData['chapters'][chapterId];

    final topicsData = chapterData['topics'];

    final List<TopicModel> topics = [];
    (topicsData as Map<String, dynamic>).forEach((key, value) {
      topics.add(TopicModel.fromJson(value));
    });

    return topics;
  }
}
