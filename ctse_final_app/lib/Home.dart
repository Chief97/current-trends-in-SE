import 'package:ctsefinalapp/BottomNavPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SignIn.dart';
import 'models/userModel.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    if(user == null) {
      return Container(
          child: Scaffold(
            body: login(),
          )
      );
    }else{
      return Container(
        child: Scaffold(
          body: BottomNavigationPage(),
        )
      );
    }
  }
}
