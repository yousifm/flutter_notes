import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/widgets/notes_list.dart';
import 'package:notes/widgets/popup_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 25,
        title: Text("Notes"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 32,
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(AddNoteScreen.routeName, arguments: null);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: PopupMenu(),
          ),
        ],
      ),
      body: Container(
          color: Theme.of(context).backgroundColor, child: NotesList()),
    );
  }
}
