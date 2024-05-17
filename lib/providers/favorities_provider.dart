import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shcool/model/card.dart';

class FavoriteCardsNotifier extends StateNotifier<List<CardModel>> {
  FavoriteCardsNotifier() : super([]);

  bool toggleCardsFavotiStatus(CardModel card) {
    final isCurrentlyFavorite = state.contains(card);

    if (isCurrentlyFavorite) {
      state = state.where((c) => c.id != card.id).toList();
      return false;
    } else {
      state = [...state, card];
      return true;
    }
  }
}

final favoriteCardsNotifier =
    StateNotifierProvider<FavoriteCardsNotifier, List<CardModel>>(
        (ref) => FavoriteCardsNotifier());
