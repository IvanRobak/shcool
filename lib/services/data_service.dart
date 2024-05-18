import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shcool/model/card.dart';

class DataService {
  Future<List<CardModel>> loadCards() async {
    final String response =
        await rootBundle.loadString('assets/data/cards.json');
    final data = json.decode(response);
    List<CardModel> cards = [];

    var topics = data['classes']['class1']['subjects']['math']['chapters']
        ['figures']['topics'];
    topics.forEach((key, value) {
      cards.add(CardModel.fromJson(value));
    });

    return cards;
  }
}
