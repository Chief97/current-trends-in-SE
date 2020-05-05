import 'package:ctsefinalapp/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  AuthenticationService auth;

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
//
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Align(
                     alignment: Alignment.center,
                     child: CircleAvatar(
                       radius: 80,
                       backgroundColor: Color(0xffeeeeee),
                       child: ClipOval(
                         child: new SizedBox(
                           width: 180.0,
                           height: 180.0,
                           child: (userProfilePic!=null)?Image.file(
                             userProfilePic,
                             fit: BoxFit.fill,
                           ):Image.network(
                             "https://img.pngio.com/registration-for-under-graduate-student-icon-png-free-student-icon-png-820_731.png",
                             fit: BoxFit.fill,
                           ),
                         ),
                       ),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(top: 60.0),
                     child: IconButton(
                       icon: Icon(
                         FontAwesomeIcons.camera,
                         size: 30.0,
                       ),
                       onPressed: () {
                         getImage();
                       },
                     ),
                   ),
                 ],

               ),
//                 SizedBox(height: 20.0),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Align(
                 alignment: Alignment.center,
                 child:FutureBuilder<FirebaseUser>(
                     future: FirebaseAuth.instance.currentUser(),
                     builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
                       if (snapshot.connectionState == ConnectionState.done) {
                         return new Text (
                           "User :\t ${snapshot.data.email} \n ",style: TextStyle(
                             color: Colors.black,
                             fontFamily: 'SFUIDisplay',
                             fontSize: 20.0
                         ),
                         );
                       }
                       else {
                         return new Text('Loading...');
                       }
                     },
                   ),
               ),
             ],
           ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Align(
                     alignment: Alignment.center,
                     child: Text("Module : CTSE \n",style: TextStyle(
                         color: Colors.black,
                         fontFamily: 'SFUIDisplay',
                         fontSize: 20.0
                     ),),

                   ),
           ],
         ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       RaisedButton(
                     color: Color(0xff476cfb),
                     onPressed: () {
                       uploadPic(context);
                     },
                     elevation: 4.0,
                     splashColor: Colors.blueGrey,
                     child: Text(
                       'Upload Dp',
                       style: TextStyle(color: Colors.white, fontSize: 16.0),
                     ),
                   ),

                  ],
                   ),
                 ],
               ),


           )
         ,
      )
    )


    );}}

Widget HeaderDesign(BuildContext context) {
  var width = MediaQuery
      .of(context)
      .size
      .width;

  return ClipRRect(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
    child: Container(
        height: 280,
        width: width,
        decoration: BoxDecoration(
          color: Colors.pink,
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                bottom: 10,
                right: -60,
                child: HeaderCircleDesign(150, Colors.pinkAccent,borderColor: Colors.white38)
            ),

            Positioned(
                top: -40,
                left: -45,
                child: HeaderCircleDesign(width * .5, Colors.pinkAccent,borderColor: Colors.white38)),
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
//                              await _auth.signOut();
//                              showToast();
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
                        SizedBox(height: 100),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "User Profile",
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),


                      ],
                    ))),

          ],
        )
    ),
  );
}

//This is for Header Circle Design Function
Widget HeaderCircleDesign(double height, Color color,
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




