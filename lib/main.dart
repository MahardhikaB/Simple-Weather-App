import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/note_data.dart';
import 'package:weather_app/pages/main_page.dart';
import 'package:weather_app/pages/notes_page.dart';
import 'pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteData(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NotePage(),
      ),
    );
  }
}

