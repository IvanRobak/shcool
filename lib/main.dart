import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shcool/screen/favorite.dart';
import 'package:shcool/screen/tabs_screen.dart';

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 123, 54, 171),
    ),
    textTheme: GoogleFonts.latoTextTheme());

void main() {
  runApp(const ProviderScope(
    child: (MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
      routes: {
        '/favorite': (context) => const FavoriteScreen(),
        // інші маршрути вашого додатку
      },
    );
  }
}
