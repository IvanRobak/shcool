import 'package:riverpod/riverpod.dart';
import 'package:shcool/data/dummy_data.dart';

final cardsProvider = Provider((ref) {
  return cards;
});
