import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bluefrost/widgets/appbar.dart';
import 'package:flutter/rendering.dart';

class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {
  //This is the value of the selected item of the spinner
  var value;

  @override
  void initState() {
    //The value is 1 on start
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
              //As usual a darkened background image
              fit: BoxFit.cover,
              image: AssetImage("assets/background.jpg"),
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(.9), BlendMode.dstATop),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //I have a sizedbox to center the spinner so that it doesn't hide behind the bottom app bar
              Expanded(child: spinner()),
              SizedBox(height: 50),
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

  //This widget generates a "spinner" with 150 childs and loops itself
  Widget spinner() {
    return ListWheelScrollView.useDelegate(
      onSelectedItemChanged: (val) => value = val + 1,
      diameterRatio: 2,
      itemExtent: 100,
      childDelegate: ListWheelChildLoopingListDelegate(
        children: List<Widget>.generate(
          150, (index) => section(),
        ),
      ),
    );
  }

  //Each section generates a number, and depending on it uses a certain color
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

    //If the number generated is 1 its text becomes "Rare item"
    text = random == 1 ? "Rare item" : "?";

    return Container(
      color: color,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 50))],
      ),
    );
  }
}
