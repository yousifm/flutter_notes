import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Icon(Icons.more_vert),
      itemBuilder: (ctx) {
        return [
          PopupMenuItem(
            child: Row(
              children: <Widget>[
                Icon(Icons.search),
                SizedBox(
                  width: 10,
                ),
                Text("Search")
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              children: <Widget>[
                Icon(Icons.sort),
                SizedBox(
                  width: 10,
                ),
                Text("Sort")
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              children: <Widget>[
                Icon(Icons.settings),
                SizedBox(
                  width: 10,
                ),
                Text("Settings")
              ],
            ),
          )
        ];
      },
    );
  }
}
