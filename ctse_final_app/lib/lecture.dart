import 'package:ctsefinalapp/models/lectureModel.dart';
import 'package:ctsefinalapp/services/authentication.dart';
import 'package:ctsefinalapp/services/firebase_service.dart';
import 'package:ctsefinalapp/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Animation/Fade_Animation.dart';
import 'courseModel.dart';
import 'package:mobile_popup/mobile_popup.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class Lecture extends StatefulWidget {
  Lecture({Key key}) : super(key: key);
  @override
  _LectureState createState() => _LectureState();
}

class _LectureState extends State<Lecture> {
double width;
  final AuthenticationService _auth = AuthenticationService();

  final _key = GlobalKey<FormState>();

//  String fileName = '';
  String lectureTitle = '';
  String week = '';
  String lecturerName = '';
  String error = '';
  File tempFile;
  List<String> extentions = new List<String>();
//  StorageUploadTask uploadTask;
//  String _path;
//  Map<String,String> _paths;
//  String _extension;
//  bool _loadingPath = false;
//  bool _hasValidMime = false;
//  FileType _pickingType;
//  TextEditingController _controller = new TextEditingController();

//Toast Function Implementation
void showToast() {
  Fluttertoast.showToast(
      msg: 'File uploaded Successfully ',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 2,
      backgroundColor: Colors.pinkAccent,
      textColor: Colors.white
  );
}

Future openFileExplorer() async {
//  if(_pickingType != FileType.custom || _hasValidMime){
//    setState(() =>_loadingPath = true);
  extentions.add('pdf');
    try{
      tempFile = await FilePicker.getFile(type: FileType.custom, allowedExtensions: extentions);
    }catch(e){
      print(e.toString());
    }
}


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
                            title: 'Add Lecture Materials',
                            child: Builder(
                              builder: (navigator) => Scaffold(
                                body: SingleChildScrollView(
                                    child: Form(
                                      key: _key,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: TextFormField(
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                              validator: (value) => value.isEmpty ? 'Enter week number' : null,
                                              onChanged: (value){
                                                setState(() => week = value );
                                              },
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
                                                color: Colors.black,
                                              ),
                                              validator: (value) => value.isEmpty ? 'Enter Lecture Name' : null,
                                              onChanged: (value){
                                                setState(() => lectureTitle = value );
                                              },
                                              decoration: InputDecoration(
                                                  enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.redAccent
                                                      )
                                                  ),
                                                  labelText: 'Lecture Title :',
                                                  labelStyle: TextStyle(fontSize: 20,
                                                      color: Colors.black)
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: TextFormField(
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                              validator: (value) => value.isEmpty ? 'Enter lecturer name' : null,
                                              onChanged: (value){
                                                setState(() => lecturerName = value );
                                              },
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
                                              onPressed: () {
                                                if(_key.currentState.validate()) {
                                                  openFileExplorer();
                                                }
                                                },//since this is only a UI app
                                              child: Text('Select File',
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
                                                if(_key.currentState.validate()) {
                                                  if (tempFile == null) {
                                                    Text('Select a file');
                                                  } else {
                                                    LectureModel lecture = LectureModel(
                                                        week: week,
                                                        lectureTitle: lectureTitle,
                                                        lecturerName: lecturerName);
                                                    dynamic result = FirestoreService()
                                                        .uploadLectureFile(lecture, tempFile);
                                                    if (result == null) {
                                                      setState(() => error ='Unable to upload');
                                                    }
                                                    else {
                                                      showToast();
                                                    }
                                                  }
                                                }
                                              },
                                              child: Text('Upload',
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
