import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shcool/model/topic_model.dart';

class FavoriteCardsNotifier extends StateNotifier<List<TopicModel>> {
  FavoriteCardsNotifier() : super([]);

  bool toggleCardsFavotiStatus(TopicModel card) {
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
    StateNotifierProvider<FavoriteCardsNotifier, List<TopicModel>>(
        (ref) => FavoriteCardsNotifier());
