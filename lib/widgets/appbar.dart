import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {

  //I return a bar with a notch in the middle
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      shape: CircularNotchedRectangle(),
      color: Colors.black.withOpacity(0.9),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //I have 4 buttons, one that reloads the app, another that goes home
            //one which opens the spinner and the other that shows the settings
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.replay_outlined, color: Colors.cyan, size: 50),
              onPressed: () => Navigator.pushReplacementNamed(context, "/"),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.home, color: Colors.cyan, size: 50),
              onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
            ),
            SizedBox(width: 20),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.refresh, color: Colors.cyan, size: 50),
              onPressed: () => Navigator.pushReplacementNamed(context, "/spinner"),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.settings, color: Colors.cyan, size: 50),
              onPressed: () => Navigator.pushReplacementNamed(context, "/settings"),
            ),
          ],
        ),
      ),
    );
  }
}
