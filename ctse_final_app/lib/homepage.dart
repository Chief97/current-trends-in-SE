
import 'package:ctsefinalapp/services/authentication.dart';
import 'package:ctsefinalapp/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'Lecture.dart';



class homePage extends StatelessWidget {

  homePage({Key key}) : super(key: key);

  double width;

  final AuthenticationService _auth = AuthenticationService();

  Widget _header(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 200,
          width: width,
          decoration: BoxDecoration(
            color: LightColor.purple,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 30,
                  right: -100,
                  child: _circleContainer(300, LightColor.lightpurple)),
              Positioned(
                  top: -100,
                  left: -45,
                  child: _circleContainer(width * .5, LightColor.darkpurple)),
              Positioned(
                  top: 50,
                  left: 0,
                  child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topRight,
                            child: FlatButton.icon(
                              icon: Icon(Icons.person),
                              label: Text('Logout'),
                              onPressed: () async {
                                await _auth.signOut();
                              },
                            ),
                          ),
                        ],
                      ))),

              Positioned(
                  top: 40,
                  left: 0,
                  child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                            ],
                          ),
                          SizedBox(height: 50),
                          Text(
                            "CTSE Home",
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 40,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )))
            ],
          )),
    );
  }

  Widget _circleContainer(double height, Color color,
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

  Widget _Row(
      String title,
      Color primary,
      Color textColor,
      ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: LightColor.lightpurple, fontSize:20,fontWeight: FontWeight.bold),
          ),

        ],
      ),
    );
  }

  Widget _featuresOfRowA() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[

            _card(
                primary: LightColor.lightOrange,
                chipColor: LightColor.lightOrange,
                backWidget: _decorationContainerC(Colors.greenAccent, 50, 20),
                chipText1: "Lecturer in charge ",
                chipText2: "Email id : dilani.l@sliit.lk",
                chiptext3: " Dilani Lunugalage",
                isPrimaryCard: true,
                imgPath:
                "https://www.sliit.lk/profile/uploads/48087608_320634925441990_5844369803069882368_n.jpg"),
            _card(
                primary: Colors.lightBlueAccent,
                chipColor: LightColor.darkBlue,
                backWidget: _decorationContainerA(Colors.blueAccent, 50, -30),
                chipText1: "Lab In Charge ",
                chipText2: "Email id :thilini.b@sliit.lk",
                chiptext3: " Buddika Jayasinghe",
                isPrimaryCard: true,
                imgPath:
                "https://cdn3.iconfinder.com/data/icons/school-glyph/512/Girl_hipster_lady_woman_teacher-512.png"),

          ],
        ),
      ),
    );
  }

  Widget _featureOfRowB() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _card(
                primary: LightColor.seeBlue,
                chipColor: LightColor.seeBlue,
                backWidget: _decorationContainerA(
                  Colors.white,
                  -50,
                  30,
                ),
                chipText1: "   Machine Learing ",
                chipText2: "",
                imgPath:
                "https://legalworld.wolterskluwer.be/media/5311/alex-knight-199368.jpg?mode=pad&width=800&height=1200"),
            _card(
                primary: LightColor.seeBlue,
                chipColor: LightColor.seeBlue,
                backWidget: _decorationContainerA(
                  Colors.white,
                  -50,
                  30,

                ),
                chipText1: "Flutter",
                chipText2: "",
                imgPath:
                "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png"),
            _card(
                primary: LightColor.seeBlue,
                chipColor: LightColor.seeBlue,
                backWidget: _decorationContainerA(
                  Colors.white,
                  -50,
                  30,
                ),
                chipText1: "Microservices",
                chipText2: "",
                imgPath:
                "https://pokalablog.files.wordpress.com/2016/09/microservices.jpg?w=772"),
            _card(
                primary: LightColor.seeBlue,
                chipColor: LightColor.seeBlue,
                backWidget: _decorationContainerA(
                  Colors.white,
                  -50,
                  30,
                ),
                chipText1: "Docker",
                chipText2: "",
                imgPath: "https://cdn-images-1.medium.com/max/1600/1*9hGvYE5jegHm1r_97gH-jQ.png"),

            _card(
                primary: LightColor.seeBlue,
                chipColor: LightColor.seeBlue,
                backWidget: _decorationContainerA(
                  Colors.white,
                  -50,
                  30,
                ),
                chipText1: "     Program Languages",
                chipText2: "",
                imgPath:
                "https://www.itstarterseries.com/wp-content/uploads/2018/04/best-programming-language-to-learn.jpg"),
          ],
        ),
      ),
    );
  }

  Widget _card(
      {Color primary = Colors.redAccent,
        String imgPath,
        String chipText1 = '',
        String chipText2 = '',
        String chiptext3='',
        String chiptext4='',
        String chiptext5='',

        Widget backWidget,
        Color chipColor = LightColor.orange,
        bool isPrimaryCard = false}) {
    return Container(
        height: isPrimaryCard ? 230 : 120,
        width: isPrimaryCard ? width * .50 : width * .40,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            color: primary.withAlpha(200),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  color: LightColor.lightpurple.withAlpha(20))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                backWidget,
                Positioned(
                    top: 20,
                    left: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: NetworkImage(imgPath),
                    )),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: _cardInfo(chipText1, chipText2,chiptext3,
                      LightColor.titleTextColor, chipColor,
                      isPrimaryCard: isPrimaryCard),
                )
              ],
            ),
          ),
        ));
  }

  Widget _cardInfo(String title, String courses,String email,  Color textColor, Color primary,
      {bool isPrimaryCard = false}) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right:60),
            width: width * .60,
            alignment: Alignment.topCenter,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isPrimaryCard ? Colors.yellow : textColor),
            ),


          ),
          Container(
            padding: EdgeInsets.only(top:7),
            width: width * .50,
            height: 20,
            alignment: Alignment.topCenter,
            child: Text(
              email,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isPrimaryCard ? Colors.white : textColor),
            ),


          ),
          SizedBox(height: 15),
          _setchip(courses, primary, height: 5, isPrimaryCard: isPrimaryCard),


        ],
      ),
    );
  }

  Widget _setchip(String text, Color textColor,
      {double height = 10, bool isPrimaryCard = false}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: textColor.withAlpha(isPrimaryCard ? 250 : 50),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isPrimaryCard ? Colors.white : textColor, fontSize: 12),
      ),
    );
  }

  Widget _decorationContainerA(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: primary.withAlpha(255),
          ),
        ),

      ],
    );
  }



  Widget _decorationContainerC(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -105,
          left: -35,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: LightColor.orange.withAlpha(100),
          ),
        ),
        Positioned(
            top: 35,
            right: -40,
            child: ClipRect(
                child: CircleAvatar(
                    backgroundColor: LightColor.orange, radius: 40))),

      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(

        body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  _header(context),
                  SizedBox(height: 20),
                  _Row("Lecturer Details", LightColor.orange, LightColor.orange),
                  _featuresOfRowA(),
                  SizedBox(height: 0),
                  _Row(
                      "Course Details : Semester Contents", LightColor.purple, LightColor.darkpurple),
                  _featureOfRowB()
                ],
              ),
            )));
  }
}