import 'package:ctsefinalapp/models/lectureModel.dart';
import 'package:ctsefinalapp/services/authentication.dart';
import 'package:ctsefinalapp/services/firebase_service.dart';
import 'package:ctsefinalapp/Color/light_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Animation/Fade_Animation.dart';
import 'package:mobile_popup/mobile_popup.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class Lecture extends StatefulWidget {
  Lecture({Key key}) : super(key: key);
  @override
  _LectureState createState() => _LectureState();
}

class _LectureState extends State<Lecture> {
double width;
  final AuthenticationService _auth = AuthenticationService();

  final _key = GlobalKey<FormState>();
  final _key1 = GlobalKey<FormState>();

  bool _loading = false;
  String _fileName = '';
  String lectureTitle = '';
  String week;
  String lecturerName = '';
  String error = '';
  File tempFile;
  List<String> ext = new List<String>();
  String _type = "lectures";
  dynamic _lectures;
  String _download;
  String _week,_title, _lecturerName;
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

//accessing the local directory
Future openFileExplorer() async {
  setState(() =>_loading = true);
  ext.add('pdf');
    try{
      tempFile = await FilePicker.getFile(type: FileType.custom, allowedExtensions: ext);
    }on PlatformException catch(e){
      print(e.toString());
    }
}

//initializing the firebase lecture reference
@override
void initState(){
  FirestoreService().getLecturesData().then((results){
    setState (() {
      _lectures = results;
    });
  });
  super.initState();
}

//Design for Header
  Widget headerDesign(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 180,
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
                  child: headerCircleDesigner(300, Colors.orangeAccent)),
              Positioned(
                  top: -60,
                  left: -65,
                  child: headerCircleDesigner(width * .5, Colors.orangeAccent)),
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

  //Design for Header
  Widget headerCircleDesigner(double height, Color color,
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


  //mobile popup to update data
  showPopup(String id,LectureModel lecture) {
    return showMobilePopup(
        context: context,
        builder: (context) => MobilePopUp(
          title: 'Update Lecture ',
          child: Builder(
            builder: (navigator) => Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: _key1,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextFormField(
                          initialValue: lecture.week.toString(),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          validator: (value) => value.isEmpty ? 'Enter Week' : null,
                          onChanged: (value){
                            setState(() => _week = value );
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
                          initialValue: lecture.title,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          validator: (value) => value.isEmpty ? 'Enter Title' : null,
                          onChanged: (value){
                            setState(() => _title = value );
                          },
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.redAccent
                                  )
                              ),
                              labelText: 'Title :',
                              labelStyle: TextStyle(fontSize: 20,
                                  color: Colors.black)
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextFormField(
                          initialValue: lecture.lecturerName,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          validator: (value) => value.isEmpty ? 'Enter lecturer name' : null,
                          onChanged: (value){
                            setState(() => _lecturerName = value );
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
                            if(_key1.currentState.validate()) {
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
                            if(_key1.currentState.validate()) {
                              LectureModel newLecture = LectureModel(
                                  week: int.parse(_week),
                                  title: _title,
                                  lecturerName: _lecturerName);
                              print('calling method');
                              dynamic result = await FirestoreService.updateDetails(newLecture,id, _type, tempFile);
                              print('method returned');
                              if (result == null) {
                                setState(() => error ='Unable to update');
                              }
                              else {
                                print('toast called');
                                showToast();
                              }
                            }
                          },
                          child: Text('Update Lecture ',
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
        )
    );
  }

  //confirmation dialog to delete data
  Future<bool> confirmationDialog(
      BuildContext context, String id) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete'),
          content: Text('Are you sure you want to delete this Notification?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            FlatButton(
                child: Text('Delete'),
                onPressed: () {
                  /*Delete Notification*/
                  print('method to be called');
                  print(id);
                  FirestoreService.deleteData(id,_type);
                  Navigator.of(context).pop(true);
                }),
          ],
        );
      },
    );
  }

  //Displaying lectures collection data
  Widget DisplayLectures(BuildContext context){
    //Using StreamBuilder to listen to changes in data collection
    return StreamBuilder(
      stream: _lectures,
      builder: (context, snapshot){
        if(!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                //using ListView to display data
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index)
                    {
                      LectureModel lecture = LectureModel(
                        week: snapshot.data.documents[index]['week'],
                        title: snapshot.data.documents[index]['title'],
                          lecturerName: snapshot.data.documents[index]['lecturerName']
                      );
                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption:'Update',
                            color: Colors.blue,
                            icon:Icons.update,
                            onTap: () { showPopup(
                                snapshot.data.documents[index]['id'], lecture);}
                          ),
                          IconSlideAction(
                            caption:'Delete',
                            color: Colors.red,
                            icon:Icons.delete,
                            onTap: () => confirmationDialog(context, snapshot.data.documents[index]['id']),
                          ),
                        ],
                        child: ListTile(
                            title: RichText(
                                text: new TextSpan(
                                    children: [
                                      new TextSpan(
                                        text: 'Week '+snapshot.data.documents[index]['week'].toString(),
                                        style: new TextStyle(
                                            color: Colors.black,
                                            fontSize: 25),
                                      ),
                                    ]
                                )
                            ),
                            subtitle: RichText(
                                text: new TextSpan(
                                    children: [
                                      new WidgetSpan(
                                          child: Icon(
                                            Icons.picture_as_pdf,
                                            size: 25,
                                            color: Colors.red,
                                          )
                                      ),
                                      new TextSpan(
                                          text: '  '+ snapshot.data.documents[index]['title'],
                                          style: new TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 19,
                                          ),
                                          recognizer: new TapGestureRecognizer()
                                            ..onTap = () async {
                                              _download = await FirestoreService().downloadFile(_type, snapshot.data.documents[index]['id']);
                                              launch(_download);
                                            }
                                      ),
                                    ]
                                )
                            )
                        ),
                      );
                      },
                    separatorBuilder: (BuildContext context, int index){
                      return Divider(
                        color: Colors.black,
                      );
                    },
                  itemCount: snapshot.data.documents.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                )
              )
            ],
          );
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
            child:  FadeAnimation(1,
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Assets/white2.jpg'),
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.center
                      )
                  ),
                  child: Column(
                    children: <Widget>[
                      headerDesign(context),
                      DisplayLectures(context),
                     SizedBox(height: 40.0,),
                  //Added Add Icon Button
                      IconButton(
                        icon: Icon(Icons.add_circle),
                        color: Colors.orangeAccent,
                        iconSize: 60,
                        alignment: Alignment.topCenter,
                        focusColor: Colors.redAccent,

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
                                              keyboardType: TextInputType.number,
//                                              inputFormatters: <TextInputFormatters>[
//                                                WhitelistingTextInputFormatter.digitsOnly
//                                              ],
                                              validator: (value) => value.isEmpty ? 'Enter week number' : null,
                                              onChanged: (value){
                                                setState(() => week = value);
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
                                                        week: int.parse(week),
                                                        title: lectureTitle,
                                                        lecturerName: lecturerName);
                                                    dynamic result = await FirestoreService()
                                                        .uploadFile(lecture, _type, tempFile);
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
                )
            )
        )
    );
  }
}
