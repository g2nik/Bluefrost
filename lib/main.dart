import 'package:bluefrost/pages/spinner.dart';
import "package:flutter/material.dart";
import "pages/loading.dart";
import "package:bluefrost/pages/settings.dart";
import "package:bluefrost/pages/welcome.dart";
import "package:bluefrost/pages/home.dart";
 
void main() => runApp(App());
 
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: "BlueFrost",
      initialRoute: "/",
      routes: {
        "/": ( BuildContext context ) => Loading(),
        "/welcome": ( BuildContext context ) => Welcome(),
        "/home": ( BuildContext context ) => Home(),
        "/spinner": ( BuildContext context ) => Spinner(),
        "/settings": ( BuildContext context ) => Settings(),
      },
    );
  }
}
