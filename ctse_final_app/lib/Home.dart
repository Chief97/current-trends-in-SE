import 'package:flutter/material.dart';

import 'SignIn.dart';
//import 'SignInTwo.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: login(),
      //body: SignInTwo(),
    );
  }
}