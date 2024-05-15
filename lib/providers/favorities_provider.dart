import 'package:riverpod/riverpod.dart';
import 'package:shcool/model/card.dart';

class FavoriteMealsNotifier extends StateNotifier<List<CardModel>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealsFavotiStatus(CardModel card) {
    final cardsFavorite = state.contains(card);

    if (cardsFavorite) {
      state = state.where((c) => c.id != card.id).toList();
      return false;
    } else {
      state = [...state, card];
      return true;
    }
  }
}

final favoriteMealsNotifier =
    StateNotifierProvider<FavoriteMealsNotifier, List<CardModel>>(
        (ref) => FavoriteMealsNotifier());
