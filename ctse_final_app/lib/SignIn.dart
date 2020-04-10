import 'package:ctsefinalapp/SignUp.dart';
import 'package:ctsefinalapp/services/authentication.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  final AuthenticationService _auth = AuthenticationService();

  final _key = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/Image.png'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter

              )
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //image: DecorationImage(image: AssetImage('Assets/bg13.jpg'),fit: BoxFit.cover),
            // color: Colors.amberAccent,
          ),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: ListView(
              children: <Widget>[

                SizedBox(height: 130,),
                Form(
                  key: _key,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Container(
                          color: Color(0xfff5f5f5),
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SFUIDisplay'
                            ),
                            validator: (value) => value.isEmpty ? 'Enter Email' : null,
                            onChanged: (val){
                              setState(()=> email = val);
                              },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                                labelStyle: TextStyle(
                                    fontSize: 15
                                )
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Color(0xfff5f5f5),
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'SFUIDisplay'
                          ),
                          validator: (value) => value.length < 6 ? 'Enter Password with min 6 characters' : null,
                          onChanged: (val){
                            setState(()=> password = val);
                            },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_outline),
                              labelStyle: TextStyle(
                                  fontSize: 15
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.center,
                  child:Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: MaterialButton(
                    onPressed: () async {
                      if(_key.currentState.validate()){
                        dynamic result = await _auth.signIn(email, password);
                        if( result == null){
                          setState(() => error = 'Could not sign in with these credentials');
                        }
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => BottomNavPage()),
//                      );
                      }
                      },//since this is only a UI app
                    child: Text('LOG IN',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'SFUIDisplay',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Color(0xffe91e63),
                    elevation: 0,
                    minWidth: 400,
                    height: 50,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),

//                Padding(
//                  padding: EdgeInsets.only(top: 20),
//                  child: MaterialButton(
//
//                    onPressed: (){
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => SignUp()),
//                      );},
//                    //since this is only a UI app
//                    child: Text('Login with Courseweb',
//                      style: TextStyle(
//                        fontSize: 15,
//                        fontFamily: 'SFUIDisplay',
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                    color: Color(0xfff9a825),
//                    elevation: 0,
//                    minWidth: 400,
//                    height: 50,
//                    textColor: Colors.white,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(50)
//                    ),
//                  ),
//                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text('Dont Have an Account?',
                      style: TextStyle(
                          fontFamily: 'SFUIDisplay',
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );},//since this is only a UI app
                    child: Text('SIGN UP',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'SFUIDisplay',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Color(0xff03a9f4),
                    elevation: 0,
                    minWidth: 400,
                    height: 50,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}