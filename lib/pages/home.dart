import 'package:flutter/material.dart';
import 'package:bluefrost/widgets/appbar.dart';

class Home extends StatelessWidget {
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
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  /*
                  Text(
                    "Blue Frost",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.cyanAccent,
                      fontFamily: "Quicksand",
                    ),
                  ),
                  */
                  SizedBox(height: 20),
                  card(context),
                  infoCard(context),
                  card(context),
                  card(context),
                  SizedBox(height:100)
                ],
              ),
            ),
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

  Widget infoCard(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Card(
        color: Colors.cyanAccent.withOpacity(0.5),
        child: ListTile(
          leading: Icon(Icons.bolt, color: Colors.white, size: 100),
          title: Text("AC/DC", style: TextStyle(color: Colors.white, fontSize: 40)),
          subtitle: Text("Back in black", style: TextStyle(color: Colors.white, fontSize: 30)),
        ),
      ),
    );
  }

  Widget card(context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Card(
                color: Colors.cyanAccent.withOpacity(0.5),
                child: ListTile(
                  leading: Icon(Icons.bolt, color: Colors.white, size: 50),
                  title: Text("AC/DC", style: TextStyle(color: Colors.white)),
                  subtitle: Text("Thunderstruck", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: Card(
                color: Colors.white.withOpacity(0.9),
                child: ListTile(
                  leading: Icon(Icons.music_note, color: Colors.cyan, size: 50),
                  title: Text("AC/DC"),
                  subtitle: Text("Back in black"),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Card(
                color: Colors.white.withOpacity(0.9),
                child: Icon(Icons.album, color: Colors.cyan, size: 150),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Card(
                color: Colors.cyanAccent.withOpacity(0.5),
                child: Icon(Icons.bolt, color: Colors.white, size: 150),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
