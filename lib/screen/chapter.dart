// import 'package:flutter/material.dart';
// import 'package:shcool/data/dummy_data.dart';
// import 'package:shcool/screen/play.dart';
// import 'package:shcool/screen/study.dart';
// import 'package:shcool/widgets/chapter_grid.dart';

// class ChapterScreen extends StatefulWidget {
//   const ChapterScreen({super.key});

//   @override
//   State<ChapterScreen> createState() => _ChapterScreenState();
// }

// class _ChapterScreenState extends State<ChapterScreen> {
//   void _selectStudy(BuildContext context) {
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (ctx) => const StudyScreen()));
//   }

//   void _selectPlay(BuildContext context) {
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (ctx) => const PlayScreen()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Навчайся або грайся :)'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               for (final category in availableChapters)
//                 Column(
//                   children: [
//                     ChapterGridItem(category: category),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             _selectStudy(context);
//                           },
//                           child: const Text('Вчити'),
//                         ),
//                         const SizedBox(width: 60),
//                         ElevatedButton(
//                           onPressed: () {
//                             _selectPlay(context);
//                           },
//                           child: const Text('Грати'),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
