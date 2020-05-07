import 'package:ctsefinalapp/services/authentication.dart';
import 'package:ctsefinalapp/Color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Animation/Fade_Animation.dart';



class homePage extends StatelessWidget {

  homePage({Key key}) : super(key: key);
  double width;
  bool _loading = false;

  final AuthenticationService _auth = AuthenticationService();

  //Design the Header
  Widget headerDesign(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 200,
          width: width,
          decoration: BoxDecoration(
            color:Colors.cyan[600],
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 30,
                  right: -100,
                  child: headerCircleDesign(300, Colors.cyan)
              ),
              Positioned(
                  top: -100,
                  left: -45,
                  child: headerCircleDesign(width * .5,Colors.cyan)),
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
                          SizedBox(height: 80),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "CTSE Home",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ],
                      )
                  )
              )
            ],
          )
      ),
    );
  }

  //This is for Header Circle Design Function
  Widget headerCircleDesign(double height, Color color,
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


//Design  Rows
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
                color: Colors.blue[900],
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }


  //This is indicate the first row which contains Lecturer,Lab in charge Details
  Widget firstRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[

            card(
                primarycolor: Colors.lightBlue[200],
                emailchipColor:Colors.cyan,
                backWidget: decorationOfLectureCard(Colors.white, 50, 20),
                textOne: "Lecturer in charge ",
                lecturerName: "Email id : dilani.l@sliit.lk",
                emailId: " Dilani Lunugalage",
                isPrimaryCard: true,
                imagePath:
                "https://www.sliit.lk/profile/uploads/48087608_320634925441990_5844369803069882368_n.jpg"),
            card(
                primarycolor: Colors.lightBlue[200],
                emailchipColor: Colors.cyan,
                backWidget: decorationOfLectureCard(Colors.cyan, 50, 00),
                textOne: "Lab In Charge ",
                lecturerName: "Email id : thilini.b@sliit.lk",
                emailId: " Buddika Jayasinghe",
                isPrimaryCard: true,
                imagePath: "https://cdn3.iconfinder.com/data/icons/school-glyph/512/Girl_hipster_lady_woman_teacher-512.png"),

          ],
        ),
      ),
    );
  }

  //This is indicate the Second row which contains Course Details
  Widget secondRow() {
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
                imagePath: "https://legalworld.wolterskluwer.be/media/5311/alex-knight-199368.jpg?mode=pad&width=800&height=1200",
                courseName: " Machine Learning "
            ),
            card(
                primarycolor: LightColor.seeBlue,
                emailchipColor: LightColor.seeBlue,
                backWidget: decorationOfCourseCard(
                  Colors.white,
                  -50,
                  30,
                ),
                imagePath: "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png",
                courseName: " Flutter "
            ),

            card(
              primarycolor: LightColor.seeBlue,
              emailchipColor: LightColor.seeBlue,
              backWidget: decorationOfCourseCard(
                Colors.white,
                -50,
                30,
              ),
              imagePath: "https://pokalablog.files.wordpress.com/2016/09/microservices.jpg?w=772",
              courseName: "MicroServices",
            ),
            card(
              primarycolor: LightColor.seeBlue,
              emailchipColor: LightColor.seeBlue,
              backWidget: decorationOfCourseCard(
                Colors.white,
                -50,
                30,
              ),
              imagePath: "https://cdn-images-1.medium.com/max/1600/1*9hGvYE5jegHm1r_97gH-jQ.png",
              courseName: "Docker",
            ),

            card(
              primarycolor: LightColor.seeBlue,
              emailchipColor: LightColor.seeBlue,
              backWidget: decorationOfCourseCard(
                Colors.white,
                -50,
                30,
              ),
              imagePath: "https://www.itstarterseries.com/wp-content/uploads/2018/04/best-programming-language-to-learn.jpg",
              courseName: "Prog. Languages",
            ),
          ],
        ),
      ),
    );
  }

  /* Card Function : Each box in the page : Lecture,Lab, Course Contents,*/
  Widget card({Color primarycolor = Colors.blue,
    String imagePath,
    String textOne = '',
    String emailId = '',
    String lecturerName = '',
    String courseName = '',
    Widget backWidget,
    Color emailchipColor = Colors.cyan,
    bool isPrimaryCard = false}) {
    return Container(
      /* Set Here Cards Alignment:height  */
        height: isPrimaryCard ? 230 : 180,
        width: isPrimaryCard ? width * .50 : width * .40,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            color: primarycolor.withAlpha(190),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 10,
                  color: LightColor.lightGrey.withAlpha(20)
              )
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
                      radius: 35,
                      backgroundImage: NetworkImage(imagePath),
                    )),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: detailsOfCard(textOne, lecturerName, emailId,
                      LightColor.titleTextColor, emailchipColor, courseName,
                      isPrimaryCard: isPrimaryCard),
                )
              ],
            ),
          ),
        ));
  }


/* This function indicates the Card Details */
  Widget detailsOfCard(String textOne, String emailId, String LecturerName,
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
                  color: isPrimaryCard ? Colors.blueAccent : textColor),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 7),
            width: width * .45,
            height: 20,
            alignment: Alignment.topCenter,
            child: Text(
              LecturerName,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isPrimaryCard ? Colors.blue[900] : textColor),
            ),
          ),
          SizedBox(height: 10.0),
          emailDesigner(emailId, primary, height: 4, isPrimaryCard: isPrimaryCard), //

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
                  color: isPrimaryCard ? Colors.blue[900] : textColor),
            ),
          ),
        ],
      ),
    );
  }

  //This function for design EmailID property in the Lecturer,Lab Deatils
  Widget emailDesigner(String text, Color textColor,
      {double height = 10, bool isPrimaryCard = false}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        //Set Border as Circular
        color: textColor.withAlpha(isPrimaryCard ? 250 : 50), //Highlight EmaiId
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isPrimaryCard ? Colors.white : textColor, fontSize: 12,fontWeight: FontWeight.bold),
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
            backgroundColor: Colors.blue[800].withAlpha(50),
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


  //build
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: FadeAnimation(1, Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/white2.jpg'),
                      fit: BoxFit.fill,
                      alignment: Alignment.center
                  )
              ),
              child: Column(
                children: <Widget>[
                  headerDesign(context),
                  SizedBox(height: 20),
                  Rows(
                      "Lecturer Details", Colors.white, Colors.blue[800]),
                  firstRow(),
                  //SizedBox(height: 0),
                  Rows(
                      "Course Details : Semester Contents", Colors.cyan,
                      Colors.cyan),
                  secondRow()
                ],
              ),
            ))));
  }
}
