import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

//This widget shows a text that "shines" or more specifically
//changes its colors to similar ones to get that effect
class AnimatedText extends StatelessWidget {
  AnimatedText(this.text, [this.size = 45, this.duration = 150]);

  String text;
  double size;
  int duration;

  @override
  Widget build(BuildContext context) {
    return ColorizeAnimatedTextKit(
      speed: Duration(milliseconds: duration),
      repeatForever: true,
      totalRepeatCount: 1,
      isRepeatingAnimation: true,
      onTap: () {},
      textAlign: TextAlign.center,
      alignment: AlignmentDirectional.topStart,
      text: [text],
      textStyle: TextStyle(
        color: Colors.cyan,
          fontSize: size,
          fontFamily: "Quicksand",
      ),
      //These colors give a shining effect
      colors: [
        Colors.cyan,
        Colors.cyanAccent,
        Colors.blue,
        Colors.indigo,
        Colors.blue,
        Colors.cyanAccent,
      ],
    );
  }
}