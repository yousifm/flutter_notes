import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';

class Note {
  String id;
  String title;
  String content;
  DateTime timeEditted;

  Note(this.id, this.title, this.content, this.timeEditted);

  Note.newNote(this.title, this.content) {
    id = Uuid().v4();
    timeEditted = DateTime.now();
  }

  get values => {
        "id": id,
        "title": title,
        "content": content,
        "date": timeEditted.millisecondsSinceEpoch
      };
}

class Notes with ChangeNotifier {
  static const table = 'notes';

  List<Note> _notes;
  Database database;
  bool loading = true;

  openDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = await openDatabase("notes.db", onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE $table(id TEXT PRIMARY KEY, title TEXT, content TEXT, date INTEGER)");
    }, version: 1);
  }

  getNotes() async {
    await openDB();
    List dbNotes = await database.rawQuery("SELECT * FROM notes");
    _notes = dbNotes
        .map((note) => Note(note["id"], note["title"], note["content"],
            DateTime.fromMillisecondsSinceEpoch(note["date"])))
        .toList();
    loading = false;

    notifyListeners();
  }

  Notes() {
    getNotes();
  }

  get notes => _notes;
  get length => _notes.length;
  get isLoading => loading;

  Note findByID(String id) {
    return _notes.firstWhere((n) => n.id == id);
  }

  String addNote(String title, String content) {
    var note = Note.newNote(title, content);

    _notes.add(note);
    notifyListeners();

    database.insert(table, note.values);

    return note.id;
  }

  void deleteNote(String id) {
    _notes.remove(findByID(id));

    notifyListeners();

    database.delete(table, where: "id='$id'");
  }

  String editNote(String id, String title, String content) {
    if (id == null) return addNote(title, content);

    var n = findByID(id);
    if (n.title != title || n.content != content)
      n.timeEditted = DateTime.now();

    n.title = title;
    n.content = content;

    notifyListeners();

    database.update(table, n.values, where: "id='$id'");
    return id;
  }
}
