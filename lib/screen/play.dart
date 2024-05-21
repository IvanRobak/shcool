import 'package:flutter/material.dart';
import 'package:shcool/model/card.dart';
import 'package:shcool/services/data_service.dart';
import 'package:shcool/widgets/bottom_navigation.dart';
import 'package:shcool/widgets/confetti.dart';
import 'package:shcool/widgets/play_card.dart';
import 'package:confetti/confetti.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int _selectedPageIndex = 0;
  late List<CardModel> cards = [];
  int _currentCardIndex = 0;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _loadCards();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
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

  void _nextCard() {
    if (_currentCardIndex < cards.length - 1) {
      setState(() {
        _currentCardIndex++;
      });
    } else {
      _showCompletionDialog();
      _confettiController.play();
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Молодець!',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Чудова робота!',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Грайся!'),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 500,
            child: cards.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : PlayCard(
                    image: cards[_currentCardIndex].imagePath,
                    options: cards[_currentCardIndex].options,
                    correctOption: cards[_currentCardIndex].correctOption,
                    onCorrectAnswer: _nextCard,
                  ),
          ),
          ConfettiOverlay(confettiController: _confettiController),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _selectedPageIndex,
        onSelect: _selectPage,
      ),
    );
  }
}
