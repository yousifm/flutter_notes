import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/providers/notes.dart';
import 'package:notes/screens/homescreen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  final notes = Notes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: {
        "/": (context) =>
            ChangeNotifierProvider.value(value: notes, child: HomeScreen()),
        AddNoteScreen.routeName: (context) =>
            ChangeNotifierProvider.value(value: notes, child: AddNoteScreen())
      },
    );
  }
}
