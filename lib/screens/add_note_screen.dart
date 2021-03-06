import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:notes/providers/notes.dart';

class AddNoteScreen extends StatefulWidget {
  static const routeName = "/add";

  AddNoteScreen();

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  bool editting = true;
  bool icon = true;
  bool setup = true;
  String noteId;
  Note note;
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  FocusNode contentFocus;

  @override
  void initState() {
    super.initState();
    contentFocus = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (setup) {
      setup = false;
      noteId = ModalRoute.of(context).settings.arguments;
      if (noteId != null) {
        editting = false;
        icon = false;
        note = Provider.of<Notes>(context).findByID(noteId);

        titleController.text = note.title;
        contentController.text = note.content;
      }
    }
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
          title: TextField(
              controller: titleController,
              style: TextStyle(
                  fontSize: 30,
                  height: 1,
                  color: Theme.of(context).primaryColor),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  enabled: editting,
                  hintText: "Title",
                  hintStyle: TextStyle(color: CupertinoColors.systemGrey),
                  border: InputBorder.none))),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                note != null
                    ? DateFormat("dd/MM/yy HH:mm").format(note.timeEditted)
                    : "",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Expanded(
              child: TextField(
                focusNode: contentFocus,
                controller: contentController,
                style: TextStyle(
                  fontSize: 26,
                  height: 1.2,
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: CupertinoColors.systemGrey),
                  hintText: "Body",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
                readOnly: !editting,
                keyboardType: TextInputType.multiline,
                maxLines: 99999,
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(icon ? Icons.check : Icons.edit),
        onPressed: () {
          if (editting) {
            noteId = Provider.of<Notes>(context, listen: false)
                .editNote(noteId, titleController.text, contentController.text);
            if (note == null)
              note =
                  Provider.of<Notes>(context, listen: false).findByID(noteId);
          }

          setState(() {
            editting = !editting;
            icon = !icon;
          });

          if (editting)
            Timer(
                Duration(milliseconds: 500), () => contentFocus.requestFocus());
        },
      ),
    );
  }
}
