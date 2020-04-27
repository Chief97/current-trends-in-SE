import 'package:ctsefinalapp/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'Animation/Fade_Animation.dart';
import 'courseModel.dart';
import 'package:mobile_popup/mobile_popup.dart';

class Lecture extends StatelessWidget {
  Lecture({Key key}) : super(key: key);double width;

  /* Header Design*/
  Widget HeaderDesign(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 120,
          width: width,
          decoration: BoxDecoration(
            color: LightColor.yellow,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 10,
                  right: -120,
                  child: HeaderCircleDesigner(100, LightColor.lightOrange2)),
              Positioned(
                  top: -60,
                  left: -65,
                  child: HeaderCircleDesigner(width * .5, LightColor.darkOrange)),
              Positioned(
                  top: -230,
                  right: -30,
                  child: HeaderCircleDesigner(width * .7, Colors.transparent, borderColor: Colors.white38)),
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
                                "Lectures",
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

  /*Header Circle Design*/
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
      height: 368,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              title,
              style: TextStyle(
                  color: LightColor.extraDarkPurple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              width: width,
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                ],
              )),

          //SizedBox(height: 10)
        ],
      ),
    );
  }

/* Define the Course by List*/
  Widget CourseListDetails() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CourseInfomation(CourseList.list[0]),
            Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            CourseInfomation(CourseList.list[1]),
            Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            CourseInfomation(CourseList.list[2]),
            Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            CourseInfomation(CourseList.list[3]),
            Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            CourseInfomation(CourseList.list[4]),
          ],
        ),
      ),
    );
  }
  

  Widget CourseInfomation(CourseModel model) {
    return Container(
        height: 170,
        width: width - 20,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: .7,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Text(model.title,
                                style: TextStyle(
                                    color: LightColor.purple,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                          CircleAvatar(
                            radius: 3,
                            //backgroundColor: background,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                      ],
                    ),)
                  ],
                ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
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
                  Rows(""),

                  //Added Add Icon Button
                  FlatButton.icon(
                    icon: Icon(Icons.add),
                    label: Text('Add'),
                    color: Colors.yellow,
                    textColor: Colors.black,

                    // Popup will be called by using showMobilePopup()
                    onPressed: () {
                        showMobilePopup(
                          context: context,
                          builder: (context) => MobilePopUp(
                            title: 'Add Lab Materials',
                            child: Builder(
                              builder: (navigator) => Scaffold(
                                body: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.redAccent
                                                  )
                                              ),
                                              labelText: 'Week :',
                                              labelStyle: TextStyle(fontSize: 20,
                                                  color: Colors.black)
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.redAccent
                                                  )
                                              ),
                                              labelText: 'Module Name :',
                                              labelStyle: TextStyle(fontSize: 20,
                                                  color: Colors.black)
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.redAccent
                                                  )
                                              ),
                                              labelText: 'Lecturer Name :',
                                              labelStyle: TextStyle(fontSize: 20,
                                                  color: Colors.black)
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: MaterialButton(
                                          onPressed: (){

                                          },//since this is only a UI app
                                          child: Text('File Upload',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'SFUIDisplay',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          color: Color(0xff9e9e9e),
                                          minWidth: 100,
                                          height: 30,
                                          textColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(0.0)
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(30),
                                        child: MaterialButton(
                                          onPressed: () async {
//
                                          },
                                          child: Text('Submit',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'SFUIDisplay',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                            ),
                                          ),
                                          color: Color(0xffff2d55),
                                          elevation: 0,
                                          minWidth: 350,
                                          height: 60,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50)
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  //CourseListDetails()
                ],
              ),
            ))));
  }
}
