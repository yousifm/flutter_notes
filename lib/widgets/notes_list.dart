import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:notes/providers/notes.dart';
import 'package:notes/widgets/note_item.dart';

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Notes notes = Provider.of<Notes>(context);

    return notes.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300),
                itemCount: notes.length,
                itemBuilder: (ctx, index) => NoteItem(notes.notes[index])),
          );
  }
}
