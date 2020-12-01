import 'package:flutter/material.dart';
import 'package:bluefrost/widgets/appbar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
          child: Center(
            child: Column(
              children: [
		//I use a nice padding here with a text inside
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Cities temperatures",
                    style: TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 30
                    ),
                  ),
                ),
                cityTemp("Moscow", 1),
                cityTemp("Berlin", 20),
                cityTemp("New York", 8),
                cityTemp("Cairo", 30),
                cityTemp("Istanbul", 32),
                cityTemp("Tokyo", 12),
                cityTemp("Pekin", 24),
              ],
            ),
          ),
        ),
	//I use the bottom menu widget combined with a floating action button in the middle
	//to make it look nice
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

  //This widget returns a list tile showing the temperature and name of a city
  Widget cityTemp(String city, int temp) {
    Color color;
    IconData icon;

    It changes the color and symbol depending on the temperature
    if (temp < 20) {
      color = Colors.cyanAccent.withOpacity(.9);
      icon = Icons.ac_unit;
    }
    else if (temp < 30) {
      color = Colors.greenAccent.withOpacity(.9);
      icon = Icons.brightness_low;
    }
    else {
      color = Colors.amberAccent.withOpacity(.9);
      icon = Icons.local_fire_department;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        color: color,
        child: ListTile(
          leading: Icon(icon, size: 50),
          title: Text(city, style: TextStyle(fontFamily: "Quicksand", fontSize: 30)),
          trailing: Text("$temp ºC", style: TextStyle(fontFamily: "Quicksand", fontSize: 20)),
        ),
      )
    );
  }
}
