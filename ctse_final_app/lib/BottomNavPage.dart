import 'package:ctsefinalapp/homepage.dart';
import 'package:ctsefinalapp/lecture.dart';
import 'package:ctsefinalapp/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'user.dart';
import 'NotificationItemList.dart';
import 'lab.dart';



class BottomNavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationPageState();
  }
}
class BottomNavigationPageState extends State<BottomNavigationPage> {
  int numberOfTab = 0;
  // Navigation pages
  final navigationTabOptions = [
    homePage(),
    Lecture(),
    lab(),
    NotificationList(),
    User(),
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

        body: navigationTabOptions[numberOfTab],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.deepPurple,
          currentIndex: numberOfTab,
          onTap: (int noOfTab) {
            setState(() {
              numberOfTab = noOfTab;
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