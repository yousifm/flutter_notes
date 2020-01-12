import 'package:flutter/material.dart';

import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/widgets/notes_list.dart';
import 'package:notes/widgets/popup_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text("Notes"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(AddNoteScreen.routeName, arguments: null);
            },
          ),
          PopupMenu()
        ],
      ),
      body: NotesList(),
    );
  }
}
