// class Card {
//   const Card({
//     required this.imagePath,
//     required this.title,
//     required this.isFavorite,
//   });

//   final String imagePath;
//   final String title;
//   final bool isFavorite;
// }
class CardModel {
  CardModel({
    required this.imagePath,
    required this.title,
    required this.isFavorite,
    required this.options,
  });

  final String imagePath;
  final String title;
  final bool isFavorite;
  final List<String> options;
}
