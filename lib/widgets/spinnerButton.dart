import 'package:flutter/material.dart';

class SpinnerButton extends StatefulWidget {
  SpinnerButton(this.index);

  int index;

  @override _SpinnerButtonState createState() => _SpinnerButtonState();
}

class _SpinnerButtonState extends State<SpinnerButton> {

  @override
  void initState() {
    super.initState();
    print(widget.index);
  }

  @override Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Spin 2 win"),
      onPressed: () {
        print(widget.index);
      }
    );
  }
}
