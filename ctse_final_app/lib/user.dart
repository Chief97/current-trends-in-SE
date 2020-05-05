import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctsefinalapp/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'Animation/Fade_Animation.dart';
import 'models/userModel.dart';
import 'dart:io';


class userPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: UserPage(),
      debugShowCheckedModeBanner: false,
    );
  }

}

class UserPage extends StatefulWidget{
  @override
  _UserPageState createState() => new _UserPageState();

}

class _UserPageState extends State<UserPage>{
  User up=new User();
  //var user=int.parse(up.uid);
  final AuthenticationService _auth = AuthenticationService();

  File userProfilePic;

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var userImage = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        userProfilePic = userImage;
        print('Image Path $userProfilePic');
      });
    }

    Future uploadPic(BuildContext context) async{
      String fileName = basename(userProfilePic.path);
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(userProfilePic);
      StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
      setState(() {
        print("User Profile Picture uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }




    return new Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('users').snapshots(),
        builder:(context,snapshot)=> FadeAnimation(1, Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/white.jpg'),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              HeaderDesign(context),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                     // backgroundColor: Color(0xffeeeeee),
                      child: ClipOval(
                        child: new SizedBox(
                          width: 200.0,
                          height: 200.0,
                          child: (userProfilePic!=null)?Image.file(
                            userProfilePic,
                            fit: BoxFit.fitWidth,
                          ):Image.network(
                            "https://img.pngio.com/registration-for-under-graduate-student-icon-png-free-student-icon-png-820_731.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 150.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: 30.0,
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child:FadeAnimation(1, Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            //prefixIcon: Icon(Icons.people,color: Colors.pinkAccent),
                            child:
                            Text( "Full name :${snapshot.data.documents[2]['fullName']}",style: new TextStyle(fontSize: 20.0),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ),

                ],
              ),

              Container(
                margin: EdgeInsets.all(40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("E-mail :${snapshot.data.documents[2]['email']}",style: new TextStyle(fontSize: 20.0),),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Color(0xff476cfb),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    color: Color(0xff476cfb),
                    onPressed: () {
                      uploadPic(context);
                    },

                    elevation: 3.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Change Dp',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),



                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child:RaisedButton(
                              color: Color(0xff476cfb),
                              onPressed: () async{
                                await _auth.signOut();
                              },

                              elevation: 2.0,
                              splashColor: Colors.blueGrey,
                              child: Text(
                                'Log Out',
                                style: TextStyle(color: Colors.white, fontSize: 16.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),


            ],
          ),
        ),
        ),
        //appBar: HeaderCircleDesigner(20.0,),
      ),
    );
  }

}


Widget HeaderDesign(BuildContext context) {
  var width = MediaQuery
      .of(context)
      .size
      .width;
  return ClipRRect(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
    child: Container(
        height: 120,
        width: width,
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                top: 10,
                right: -120,
                child: HeaderCircleDesigner(300, Colors.pink)),
            Positioned(
                top: -60,
                left: -65,
                child: HeaderCircleDesigner(width * .5, Colors.pink)),

            Positioned(
                top: 50,
                left: 10,
                child: Container(
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              "User Profile",
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500
                              ),
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



