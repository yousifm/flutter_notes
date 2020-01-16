import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/dialogs/delete_dialog.dart';
import 'package:notes/providers/notes.dart';

class NoteItem extends StatelessWidget {
  final Note note;

  NoteItem(this.note);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(AddNoteScreen.routeName, arguments: note.id),
      child: Container(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Flexible(
                flex: 3,
                child: Text(
                  note.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: 25,
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(Icons.delete),
                    iconSize: 25,
                    color: Colors.grey,
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
                ),
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
