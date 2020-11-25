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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 90),
                    child: Swiper(
                    itemCount: 3,
                    pagination: SwiperPagination(),
                    control: SwiperControl(),
                    itemBuilder: (BuildContext context,int index) {
                      return Image.asset("assets/dragon.jpg", fit: BoxFit.fill,);
                    },
                    ),
                  ),
                ),
              ],
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
}
