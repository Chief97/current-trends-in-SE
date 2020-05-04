import 'package:ctsefinalapp/services/authentication.dart';
import 'package:ctsefinalapp/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Animation/Fade_Animation.dart';



class homePage extends StatelessWidget {

  homePage({Key key}) : super(key: key);

  double width;
  bool _loading = false;


  final AuthenticationService _auth = AuthenticationService();

  Widget HeaderDesign(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    
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
                  child: _headerCircleDesign(300, LightColor.lightpurple)
              ),
              Positioned(
                  top: -100,
                  left: -45,
                  child: _headerCircleDesign(width * .5, LightColor.darkpurple)),
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
                              icon: Icon(
                                  Icons.person,
                              color: Colors.white),
                              label: Text('Logout',
                                style: TextStyle(
                                  color: Colors.white,
                                ),),
                              onPressed: () async {
                                await _auth.signOut();
                                showToast();
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
          )
      ),
    );
  }

  //This is for Header Circle Design Function
  Widget _headerCircleDesign(double height, Color color,
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
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
  Widget FirstRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[

            card(
                primarycolor: LightColor.lightOrange,
                emailchipColor: LightColor.lightOrange,
                backWidget: decorationOfLectureCard(Colors.greenAccent, 50, 20),
                textOne: "Lecturer in charge ",
                LecturerName: "Email id : dilani.l@sliit.lk",
                EmailId: " Dilani Lunugalage",
                isPrimaryCard: true,
                imagepath:
                "https://www.sliit.lk/profile/uploads/48087608_320634925441990_5844369803069882368_n.jpg"),
            card(
                primarycolor: LightColor.lightOrange2,
                emailchipColor: LightColor.lightOrange2,
                backWidget: decorationOfLectureCard(Colors.yellow, 50, 00),
                textOne: "Lab In Charge ",
                LecturerName: "Email id :thilini.b@sliit.lk",
                EmailId: " Buddika Jayasinghe",
                isPrimaryCard: true,
                imagepath: "https://cdn3.iconfinder.com/data/icons/school-glyph/512/Girl_hipster_lady_woman_teacher-512.png"),

          ],
        ),
      ),
    );
  }

  //This is indicate the Second row which contains Course Details
  Widget SecondRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            card(
                primarycolor: LightColor.seeBlue,
                emailchipColor: LightColor.seeBlue,
                backWidget: decorationOfCourseCard(
                  Colors.white,
                  -50,
                  30,
                ),
                imagepath:
                "https://legalworld.wolterskluwer.be/media/5311/alex-knight-199368.jpg?mode=pad&width=800&height=1200",
                CourseName: " Machine Learning "
            ),
            card(
                primarycolor: LightColor.seeBlue,
                emailchipColor: LightColor.seeBlue,
                backWidget: decorationOfCourseCard(
                  Colors.white,
                  -50,
                  30,
                ),
                imagepath: "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png",
                CourseName: " Flutter "
            ),

            card(
              primarycolor: LightColor.seeBlue,
              emailchipColor: LightColor.seeBlue,
              backWidget: decorationOfCourseCard(
                Colors.white,
                -50,
                30,
              ),
              imagepath: "https://pokalablog.files.wordpress.com/2016/09/microservices.jpg?w=772",
              CourseName: "MicroServices",
            ),
            card(
              primarycolor: LightColor.seeBlue,
              emailchipColor: LightColor.seeBlue,
              backWidget: decorationOfCourseCard(
                Colors.white,
                -50,
                30,
              ),
              imagepath: "https://cdn-images-1.medium.com/max/1600/1*9hGvYE5jegHm1r_97gH-jQ.png",
              CourseName: "Docker",
            ),

            card(
              primarycolor: LightColor.seeBlue,
              emailchipColor: LightColor.seeBlue,
              backWidget: decorationOfCourseCard(
                Colors.white,
                -50,
                30,
              ),
              imagepath: "https://www.itstarterseries.com/wp-content/uploads/2018/04/best-programming-language-to-learn.jpg",
              CourseName: "Prog. Languages",
            ),
          ],
        ),
      ),
    );
  }

  /* Card Function : Each box in the page : Lecture,Lab, Machine learning,etc */
  Widget card({Color primarycolor = Colors.purple,
    String imagepath,
    String textOne = '',
    String EmailId = '',
    String LecturerName = '',
    String CourseName = '',
    Widget backWidget,
    Color emailchipColor = LightColor.orange,
    bool isPrimaryCard = false}) {
    return Container(
      /* Set Here Cards Alignment:height  */
        height: isPrimaryCard ? 230 : 180,
        width: isPrimaryCard ? width * .50 : width * .40,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            color: primarycolor.withAlpha(200),
            borderRadius: BorderRadius.all(Radius.circular(30)),
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
                    top: 40,
                    left: 40,
                    /* Set Here the Circle Image Size */
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(imagepath),
                    )),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: _detailsOfCard(textOne, LecturerName, EmailId,
                      LightColor.titleTextColor, emailchipColor, CourseName,
                      isPrimaryCard: isPrimaryCard),
                )
              ],
            ),
          ),
        ));
  }


/* This function indicates the Card Details */
  Widget _detailsOfCard(String textOne, String emailId, String LecturerName,
      Color textColor, Color primary, String CourseName,
      {bool isPrimaryCard = false}) {
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
            child: Text(
              LecturerName,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: isPrimaryCard ? Colors.white : textColor),
            ),


          ),
          SizedBox(height: 10),
          _setEmailDesigner(
              emailId, primary, height: 5, isPrimaryCard: isPrimaryCard), //

          Container(
            padding: EdgeInsets.only(top: 7),
            width: width * .35,
            height: 25,
            alignment: Alignment.topCenter,
            child: Text(
              CourseName,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isPrimaryCard ? Colors.white : textColor),
            ),
          ),
        ],
      ),
    );
  }

  //This function for design EmailID property in the Lecturer,Lab Deatils
  Widget _setEmailDesigner(String text, Color textColor,
      {double height = 10, bool isPrimaryCard = false}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        //Set Border as Circular
        color: textColor.withAlpha(isPrimaryCard ? 250 : 50), //Highlight EmaiId
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isPrimaryCard ? Colors.white : textColor, fontSize: 12),
      ),
    );
  }

  /* This function used for decorate the CourseCard */
  Widget decorationOfCourseCard(Color primary, double top, double left) {
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


/* This function used for decorate the LecturerCard */
  Widget decorationOfLectureCard(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -75,
          left: -55,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: LightColor.orange.withAlpha(100),
          ),
        ),
      ],
    );
  }

  //Toast Function Implementation
  void showToast() {
    Fluttertoast.showToast(
        msg: 'You are Logout ',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white
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
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.center
                  )
              ),
              child: Column(
                children: <Widget>[
                  HeaderDesign(context),
                  SizedBox(height: 20),
                  Rows(
                      "Lecturer Details", LightColor.orange, LightColor.orange),
                  FirstRow(),
                  //SizedBox(height: 0),
                  Rows(
                      "Course Details : Semester Contents", LightColor.purple,
                      LightColor.darkpurple),
                  SecondRow()
                ],
              ),
            ))));
  }
}
