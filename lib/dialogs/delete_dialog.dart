import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete note?"),
      content: Text("Are you sure you want to delete?"),
      actions: <Widget>[
        FlatButton(
            child: Row(
              children: <Widget>[
                Icon(Icons.delete, color: CupertinoColors.destructiveRed),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Yes",
                  style: TextStyle(color: CupertinoColors.destructiveRed),
                )
              ],
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(true);
            }),
        FlatButton(
          child: Text("No"),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(false);
          },
        )
      ],
    );
  }
}
