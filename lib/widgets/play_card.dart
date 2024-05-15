import 'package:flutter/material.dart';

class PlayCard extends StatelessWidget {
  const PlayCard({super.key, required this.image, required this.options});

  final String image;
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 330,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: options.map((option) {
                return ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 40),
                    fixedSize: const Size(140, 40),
                    backgroundColor:
                        Theme.of(context).colorScheme.onInverseSurface,
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
