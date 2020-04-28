import 'package:ctsefinalapp/theme/color/light_color.dart';
import 'package:flutter/material.dart';

import 'Animation/Fade_Animation.dart';



class notification extends StatelessWidget {
  // This widget is the root of your application.
  notification({Key key}) : super(key: key);

  double width;

  Widget HeaderDesign(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 120,
          width: width,
          decoration: BoxDecoration(
            color: LightColor.orange,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 10,
                  right: -120,
                  child: HeaderCircleDesigner(300, LightColor.lightOrange2)),
              Positioned(
                  top: -60,
                  left: -65,
                  child: HeaderCircleDesigner(width * .5, LightColor.darkOrange)),

              Positioned(
                  top: 50,
                  left: 0,
                  child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Notifications",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ))),
            ],
          )),
    );
  }

  Widget HeaderCircleDesigner(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  Widget Rows(String title) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20),
      height: 68,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: TextStyle(
                  color: LightColor.extraDarkPurple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: width,
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                ],
              )),
          SizedBox(height: 10)
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child:  FadeAnimation(1, Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/white.jpg'),
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.center
                  )
              ),
              child: Column(
                children: <Widget>[
                  HeaderDesign(context),
                  SizedBox(height: 20),
                  Rows(""),
                  //_courseList()
                ],
              ),
            )
    )
    )
    );
  }
}





