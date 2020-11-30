import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String text;

  //After 6 seconds the welcome page loads
  Future load(BuildContext context) async {
    return Future.delayed(const Duration(seconds: 6), () {
      setState(() {});
      Navigator.pushReplacementNamed(context, "/welcome");
    });
  }

  @override 
  void initState() {
    super.initState();
    text = "Loading";
    load(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                //Here i delcare a background image
                image: AssetImage("assets/background.jpg"),
                //I make the image semi transparent, so in combination of the black bacgkrougn
                //it has a darkened effect
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(.4), BlendMode.dstATop),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 75),
                SizedBox(

                  //This widget animates the Loading... text
                  child: TyperAnimatedTextKit(
                    speed: Duration(milliseconds: 200),
                    onTap: () {},
                    text: ["Loading..."],
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(fontSize: 30.0, fontFamily: "Quicksand", color: Colors.cyanAccent),
                  ),
                ),
                SizedBox(height: 100),
                SpinKitRipple(color: Colors.cyanAccent, borderWidth: 5, size: 500.0)
              ],
            ),
          ),
        ),
    );
  }
}
