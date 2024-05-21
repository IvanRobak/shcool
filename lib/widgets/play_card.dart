import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayCard extends StatefulWidget {
  const PlayCard({
    super.key,
    required this.image,
    required this.options,
    required this.correctOption,
    required this.onCorrectAnswer,
  });

  final String image;
  final List<String> options;
  final String correctOption;
  final VoidCallback onCorrectAnswer;

  @override
  State<PlayCard> createState() => _PlayCardState();
}

class _PlayCardState extends State<PlayCard> {
  String? _selectedOption;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _onOptionSelected(String option) async {
    setState(() {
      _selectedOption = option;
    });

    if (option == widget.correctOption) {
      widget.onCorrectAnswer();
      await _audioPlayer.play(AssetSource('sounds/correct.mp3'));
    } else {
      await _audioPlayer.play(AssetSource('sounds/incorrect.mp3'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final correctColor = Theme.of(context).colorScheme.primaryContainer;
    final incorrectColor = Theme.of(context).colorScheme.onTertiary;

    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 300,
        height: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.image,
                width: 310,
                height: 310,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: widget.options.map((option) {
                final isCorrect = option == widget.correctOption;
                final isSelected = option == _selectedOption;
                return ElevatedButton(
                  onPressed: () => _onOptionSelected(option),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 40),
                    fixedSize: const Size(140, 40),
                    backgroundColor: isSelected
                        ? isCorrect
                            ? correctColor
                            : incorrectColor
                        : Theme.of(context).colorScheme.onInverseSurface,
                  ),
                  child: Text(option),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
