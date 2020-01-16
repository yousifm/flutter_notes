import 'package:flutter/cupertino.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            boxShadow: [
              BoxShadow(
                  blurRadius: 9, color: Colors.black12, offset: Offset(5, 5)),
              BoxShadow(
                  blurRadius: 9, color: Colors.white70, offset: Offset(-5, -5))
            ],
            borderRadius: BorderRadius.circular(5),
          ),
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 25,
                    child: IconButton(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.delete),
                      iconSize: 25,
                      color: CupertinoColors.systemGrey,
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
      ),
    );
  }
}
