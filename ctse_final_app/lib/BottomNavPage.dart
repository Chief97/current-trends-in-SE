import 'package:ctsefinalapp/homepage.dart';
import 'package:ctsefinalapp/lecture.dart';
import 'package:ctsefinalapp/theme/color/light_color.dart';
import 'package:ctsefinalapp/user.dart';
import 'package:flutter/material.dart';

import 'lab.dart';
import 'notification.dart';



class BottomNavPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}
class MyAppState extends State<BottomNavPage> {
  int _selectedTab = 0;
  // Navigation pages
  final _pageOptions = [
    homePage(),
    Lecture(),
    lab(),
    notification(),
    user(),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          )),
      home: Scaffold(

        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.deepPurple,
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },

          //Navigation items
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: LightColor.purple,
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              backgroundColor: Colors.amber,
              title: Text('Lectures'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.laptop),
              backgroundColor: Colors.amber,
              title: Text('Lab'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              backgroundColor: Colors.redAccent,
              title: Text('Notification'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              backgroundColor: Colors.pink,
              title: Text('User'),
            ),

          ],
        ),
      ),
    );
  }}