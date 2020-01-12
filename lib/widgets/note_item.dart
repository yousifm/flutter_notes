import 'package:flutter/material.dart';
import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/dialogs/delete_dialog.dart';
import 'package:provider/provider.dart';

import 'package:notes/providers/notes.dart';

class NoteItem extends StatelessWidget {
  final Note note;

  NoteItem(this.note);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(AddNoteScreen.routeName, arguments: note.id),
      child: Card(
        elevation: 5,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Flexible(
                child: Text(
                  note.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                iconSize: 25,
                color: Colors.grey,
                alignment: Alignment.centerRight,
                onPressed: () {
                  showDialog(
                          builder: (context) => DeleteDialog(),
                          context: context)
                      .then((val) {
                    if (val)
                      Provider.of<Notes>(context, listen: false)
                          .deleteNote(note.id);
                  });
                },
              ),
            ]),
            SizedBox(height: 10),
            Expanded(
              child: Text(
                note.content,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                overflow: TextOverflow.fade,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
