import 'package:flutter/cupertino.dart';
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
    final backgroundColor = CupertinoColors.systemGrey6;
    final primaryColor = CupertinoColors.activeBlue;
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',
        backgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
            elevation: 0,
            color: backgroundColor,
            textTheme: TextTheme(
                title: TextStyle(
              fontFamily: 'OpenSans',
              color: primaryColor,
              fontSize: 28,
            )),
            iconTheme: IconThemeData(color: primaryColor),
            actionsIconTheme: IconThemeData(color: primaryColor, size: 32)),
        primaryColor: primaryColor,
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
