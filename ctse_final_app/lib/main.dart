import 'package:ctsefinalapp/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home.dart';
import 'models/userModel.dart';

//final FirebaseApp application = FirebaseApp(
//     options: FirebaseOptions(
//    googleAppID: "1:656196359855:android:7e0cdba3af1288b50d265a",
//    apiKey: "AIzaSyD6NhzmONuuxs-CwSJi5w5ugiKIxamiZwM",
//    databaseURL: "https://ctse-final-app.firebaseio.com",
//    gcmSenderID: "656196359855",
//  ),
//);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthenticationService().user,
      child: MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
