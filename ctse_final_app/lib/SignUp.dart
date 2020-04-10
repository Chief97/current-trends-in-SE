import 'package:ctsefinalapp/services/authentication.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
//      decoration: BoxDecoration(
//          image: DecorationImage(
//            image: AssetImage('Assets/bg13.jpg'),
//            fit: BoxFit.fitHeight,
//          )
//      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10000),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 140,),
                Form(
                  key: _key,
                  child: Column(
                    children: <Widget>[
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
}