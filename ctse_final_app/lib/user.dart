import 'package:flutter/material.dart';
import 'package:ctsefinalapp/theme/color/light_color.dart';
import 'package:ctsefinalapp/services/authentication.dart';
import 'Animation/Fade_Animation.dart';
import 'package:provider/provider.dart';
import 'package:ctsefinalapp/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class user extends StatelessWidget {
  // This widget is the root of your application.
  user({Key key}) : super(key: key);
  final AuthenticationService _auth = AuthenticationService();

  double width;

  Widget HeaderDesign(BuildContext context) {
    //stream to access the user data
    //
    // *StreamProvider<QuerySnapshot>.value(
    //value: FirestoreService().getUserData *
    //
    //add only the part within the * to section where you want to access the
    //user data by first right clicking on return widget bulb icon and selecting
    // wrap with widget and instead of widget paste these.

    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 150,
          width: width,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                //height: .0,
                width: width,
                child: FadeAnimation(1, Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Assets/Image.png'),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter
                      )
                  ),
                )),
              ),


              Positioned(
                  top: 10,
                  right: -120,
                  child: HeaderCircleDesigner(250, LightColor.extraDarkPurple)),
              Positioned(
                  top: -60,
                  left: -65,
                  child: HeaderCircleDesigner(width * .4, LightColor.extraDarkPurple)),
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
                                "User profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              )
                          )
                        ],
                      )
                  )
              ),

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

  //Design The Rows
  Widget Rows(String title,
      Color primary,
      Color textColor,) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      height: 10,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: LightColor.lightpurple,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }


  //This is indicate the first row which contains Lecturer,Lab in charge Details
  Widget UserRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            card(
                primarycolor: Colors.pinkAccent,
                backWidget: decorationOfUserCard(
                  Colors.white,
                  30,
                  30,
                ),
                imagepath:
                "https://img.pngio.com/registration-for-under-graduate-student-icon-png-free-student-icon-png-820_731.png"),

          ],

        ),
      ),
    );
  }

  Widget displayUserInformation() {
    return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
            child: Text("Name :Name  ",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("E-mail :Email  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: MaterialButton(

              onPressed: () async {
                await _auth.signOut();
              },
              child: Text('Logout',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'SFUIDisplay',
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              color: Color(0xffff2d55),
              elevation: 0,
              minWidth: 150,
              height: 60,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
          ),

        ],
    );

  }

  /* Card Function : Each box in the page : Lecture,Lab, Machine learning,etc */
  Widget card({Color primarycolor = Colors.white,
    String imagepath,
    String textOne = '',
    Widget backWidget,
    bool isPrimaryCard = false}) {
    return Container(
      /* Set Here Cards Alignment:height  */
        height: isPrimaryCard ? 100 : 140,
        width: isPrimaryCard ? width * .50 : width * .35,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                backWidget,
                Positioned(
                    top: 5,
                    left: 10,
                    /* Set Here the Circle Image Size */
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(imagepath),
                    )),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: detailsOfCard(textOne, LightColor.titleTextColor, isPrimaryCard: isPrimaryCard),
                )
              ],
            ),
          ),
        ));
  }


/* This function indicates the Card Details */
  Widget detailsOfCard(String textOne,
      Color textColor, {bool isPrimaryCard = false}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5),
            width: width * .45,
            alignment: Alignment.center,
            child: Text(
              textOne,
              style: TextStyle(
                  height: -60,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: isPrimaryCard ? Colors.yellow : textColor),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 7),
            width: width * .50,
            height: 20,
            alignment: Alignment.topCenter,


          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }



/* This function used for decorate the LecturerCard */
  Widget decorationOfUserCard(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -65,
          left: -55,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.white.withAlpha(100),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        body: SingleChildScrollView(
            child: FadeAnimation(1, Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/white.jpg'),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter
                  )
              ),
              child: Column(
                children: <Widget>[
                  HeaderDesign(context),
                  UserRow(),
                  displayUserInformation(),
                ],
              ),
            )
            )
        )
    );
  }

}










