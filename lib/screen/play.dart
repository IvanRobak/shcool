import 'package:flutter/material.dart';
import 'package:shcool/model/card.dart';
import 'package:shcool/services/data_service.dart';
import 'package:shcool/widgets/bottom_navigation.dart';
import 'package:shcool/widgets/play_card.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int _selectedPageIndex = 0;
  late List<CardModel> cards = [];

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  void _loadCards() async {
    final dataService = DataService();
    final loadedCards = await dataService.loadCards();
    setState(() {
      cards = loadedCards;
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Грайся!'),
      ),
      body: SizedBox(
        height: 500,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cards.length,
          itemBuilder: (context, index) {
            final card = cards[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: PlayCard(
                image: card.imagePath,
                options: card.options,
                correctOption: card.correctOption,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _selectedPageIndex,
        onSelect: _selectPage,
      ),
    );
  }
}
