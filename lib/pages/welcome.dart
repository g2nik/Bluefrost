import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bluefrost/widgets/animatedText.dart';

class Welcome extends StatefulWidget {
  @override _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Timer timer;
  double height;

  @override void initState() {
    height = 0;
    timer = new Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() => height = (height == 0) ? 25 : 0);
    });
    super.initState();
  }

  @override void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/background.jpg"),
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(.6), BlendMode.dstATop),
            ),
          ),
          child: PageView(
            scrollDirection: Axis.vertical,
            children: [
              firstPage(context),
              secondPage(context),
            ]
          ),
        ),
      ),
    );
  }

  Widget firstPage(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 75),
        Text(
          "Blue Frost",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 60,
            color: Colors.cyanAccent,
            fontFamily: "Quicksand",
          ),
        ),
        Column(
          children: [
            SizedBox(height: 50),
            Text(
              DateTime.now().toString().substring(11,16),
              style: TextStyle(color: Colors.cyanAccent, fontSize: 50, fontFamily: "Quicksand")
            ),
            SizedBox(height: 350),
            AnimatedContainer(
              height: height,
              curve: Curves.decelerate,
              duration: Duration(seconds: 2),
            ),
            Icon(Icons.keyboard_arrow_down_rounded, color: Colors.cyanAccent, size: 150),
          ],
        )
      ],
    );
  }

  Widget secondPage(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .55,
            decoration: BoxDecoration(
              color: Colors.grey[900].withOpacity(.7),
            ),
            child: Column(
              children: [
                SizedBox(height: 30),
                SizedBox(
                  width: 300,
                  child: AnimatedText("Welcome to Blue Frost")
                ),
                SizedBox(height: 40),
                field("User"),
                field("Password"),
                SizedBox(height: 20),
                RaisedButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  padding: EdgeInsets.symmetric(horizontal: 64, vertical: 20),
                  color: Colors.cyan,
                  child: Text("Login"),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }


  Widget field(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      child: TextField(
        cursorColor: Colors.white,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          //filled: true,
          fillColor: Colors.cyan,
          border: InputBorder.none,
          hintText: text,

          focusedBorder: OutlineInputBorder(
            
            borderSide: BorderSide(color: Colors.cyanAccent, width: 3),
            borderRadius: BorderRadius.circular(25),
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
