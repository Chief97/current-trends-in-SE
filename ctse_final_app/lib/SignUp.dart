import 'package:ctsefinalapp/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthenticationService _auth = AuthenticationService();
  final _key = GlobalKey<FormState>();

  String fullName = '';
  String email = '';
  String password = '';
  String confPassword ='';
  String error = '';

  //Toast Function Implementation
  void showToast() {
    Fluttertoast.showToast(
        msg: 'Signup Successfully ',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.pinkAccent,
        textColor: Colors.white
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10000),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 5,),
                Form(
                  key: _key,
                  child: Column(
                    children: <Widget>[
                      headerDesign(context),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (value) => value.isEmpty ? 'Enter Fullname' : null,
                          onChanged: (value){
                            setState(() => fullName = value );
                          },
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              ),
                              labelText: 'Fullname',
                              prefixIcon: Icon(Icons.people,color: Colors.pinkAccent),
                              labelStyle: TextStyle(fontSize: 15,
                                  color: Colors.white)
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (value) => value.isEmpty ? 'Enter E-mail' : null,

                          onChanged: (value){
                            setState(() => email = value );
                            print(value);
                          },
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              ),
                              labelText: 'E-mail Address',
                              prefixIcon: Icon(Icons.email,color: Colors.pinkAccent),
                              labelStyle: TextStyle(fontSize: 15,
                                  color: Colors.white)
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (value) => value.length < 6 ? 'Enter Password with min 6 characters' : null,
                          onChanged: (value){
                            setState(() => password = value );
                          },
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              ),
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.vpn_key,color: Colors.pinkAccent),
                              labelStyle: TextStyle(fontSize: 15,
                                  color: Colors.white)
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (value) => value != password ? 'Passwords do not match' : null,
                          onChanged: (value){
                            setState(() => confPassword = value );
                          },
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              ),
                              labelText: 'Confirm Password',
                              prefixIcon: Icon(Icons.vpn_key,color: Colors.pinkAccent),
                              labelStyle: TextStyle(fontSize: 15,
                                  color: Colors.white)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: MaterialButton(
                    onPressed: () async {
                      if(_key.currentState.validate()){
                        dynamic result = await _auth.signUp(fullName, email, password);
                        if( result == null){
                          setState(() => error = 'Please supply valid credentials');
                        }
                        else{
                          showToast();
                        }
//                        Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => BottomNavPage()),
//                      );
                      }
                      },
                    child: Text('SIGN UP',
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
                SizedBox(height: 12.0),
                Align(
                  alignment: Alignment.center,
                  child:Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 16.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Design for Header
  Widget headerDesign(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 150,
          width: width,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[

              Positioned(
                  top: 50,
                  right: -150,
                  child: headerCircleDesigner(250, Colors.pink)),
              Positioned(
                  top: -20,
                  left: -65,
                  child: headerCircleDesigner(width * .4, Colors.pinkAccent)),
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
                                "Sign up",
                                style: TextStyle(
                                    color: Colors.white,
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
}