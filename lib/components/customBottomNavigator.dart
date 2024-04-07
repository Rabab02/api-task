import 'package:flutter/material.dart';
import '../HomePage.dart';
import '../mainApp.dart';
import '../profile.dart';

class customBottomNavigater extends StatefulWidget {
  const customBottomNavigater({key});
  @override
  State<customBottomNavigater> createState() => _customBottomNavigaterState();
}

class _customBottomNavigaterState extends State<customBottomNavigater> {
  int selectedIndex = 0;

  List<Widget> listwidget = [
    HomePage(),
    mainAppPage(),
    profilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (val) {
            setState(() {
              selectedIndex = val;
            });
          },
          currentIndex: selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey.shade300,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.layers), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: ''),
          ]),
      body: listwidget[selectedIndex],
    );
  }
}
