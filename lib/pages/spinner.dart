import 'dart:math';

import 'package:bluefrost/widgets/spinnerButton.dart';
import 'package:flutter/material.dart';
import 'package:bluefrost/widgets/appbar.dart';
import 'package:flutter/rendering.dart';

class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {

  var value;

  @override
  void initState() {
    value = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/background.jpg"),
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(.9), BlendMode.dstATop),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: spinner()),
              SpinnerButton(value),
              //Text(value.toString(), style: TextStyle(fontFamily: "Quicksand", fontSize: 50),),
              SizedBox(height: 120),
            ],
          ),
        ),
        bottomNavigationBar: BottomMenu(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.9),
          child: Icon(Icons.album, color: Colors.cyan, size: 50),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget spinner() {
    return ListWheelScrollView.useDelegate(
      onSelectedItemChanged: (val) => Changed(val),
      diameterRatio: 2,
      itemExtent: 100,
      childDelegate: ListWheelChildLoopingListDelegate(
        children: List<Widget>.generate(
          150, (index) => section(),
        ),
      ),
    );
  }

  void Changed(int val) {
    value = val + 1;
  }

  Widget section() {

    Color color;
    String text;

    Random rng = new Random();
    int random = rng.nextInt(149) + 1;

    if (random == 1) color = Colors.amber;
    else if (random < 5) color = Colors.red;
    else if (random < 15) color = Colors.purple;
    else if (random < 50) color = Colors.blue;
    else color = Colors.green;

    text = random == 1 ? "Rare item" : "?";

    return Container(
      color: color,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 50),)],
      ),
    );
  }
}
