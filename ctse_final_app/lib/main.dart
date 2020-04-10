import 'package:ctsefinalapp/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home.dart';
import 'models/userModel.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      child: MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
      value: AuthenticationService().user,
    );
  }
}
