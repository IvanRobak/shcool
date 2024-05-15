import 'package:riverpod/riverpod.dart';
import 'package:shcool/model/card.dart';

class FavoriteCardsNotifier extends StateNotifier<List<CardModel>> {
  FavoriteCardsNotifier() : super([]);

  bool toggleCardsFavotiStatus(CardModel card) {
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

final favoriteCardsNotifier =
    StateNotifierProvider<FavoriteCardsNotifier, List<CardModel>>(
        (ref) => FavoriteCardsNotifier());
