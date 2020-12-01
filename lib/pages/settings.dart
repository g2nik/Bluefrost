import 'package:flutter/material.dart';
import 'package:bluefrost/widgets/appbar.dart';
import 'package:bluefrost/widgets/animatedText.dart';

class Settings extends StatefulWidget {
  @override _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool lightTheme;
  Color background;

  //This function updates the boolean lightteme and the background color
  Function ChangeTheme(lightTheme) {
    this.lightTheme = lightTheme;
    //The background color is either white or a black with transparency effect.
    background = lightTheme ? Colors.grey[200] : Colors.black.withOpacity(.6);
  }

  @override void initState() {
    //At start i set the lighttheme to true
    lightTheme = true;
    background = Colors.grey[200];
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
          child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: background
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    AnimatedText("Options", 50, 300),
                    SizedBox(height: 30),
                    tile("Option 1", "A very good option", Icons.account_balance),
                    tile("Option 2", "Also a very good option", Icons.ac_unit),
                    tile("Option 3", "The BEST option", Icons.access_alarms),
                    tile("Option 4", "Meh...", Icons.settings),
                    SizedBox(height: 20),
                    themeTile(),
                    SizedBox(height: 100),
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

  Widget tile(String title, String subtitle, IconData ico) {
    return Container(
      decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.cyan.withOpacity(.3)))),
      child: ListTile(
        leading: Icon(ico, size: 40, color: Colors.cyan),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Quicksand",
            color: Colors.cyan
          )
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontFamily: "Quicksand",
            color: Colors.cyan
          )
        ),
      ),
    );
  }

  Widget themeTile() {
    return ListTile(
      title: Text(
        "Light theme",
        style: TextStyle(
          fontSize: 30,
          fontFamily: "Quicksand",
          color: Colors.cyan
        )
      ),
      trailing: Switch(
        activeColor: Colors.cyan,
        value: lightTheme,
        onChanged: (lightTheme) {setState(() => ChangeTheme(lightTheme));},
      ),
    );
  }
}
