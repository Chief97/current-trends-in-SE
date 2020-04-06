import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/bg13.jpg'),
            fit: BoxFit.fitHeight,
          )
      ),
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
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
                    onPressed: (){},
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}