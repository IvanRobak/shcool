import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
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
}
