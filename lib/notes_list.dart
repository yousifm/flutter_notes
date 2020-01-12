import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/notes.dart';

import 'note_item.dart';

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Notes notes = Provider.of<Notes>(context);

    return notes.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200),
                itemCount: notes.length,
                itemBuilder: (ctx, index) => NoteItem(notes.notes[index])),
          );
  }
}
