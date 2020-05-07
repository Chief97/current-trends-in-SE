import 'package:ctsefinalapp/models/userProfile.dart';
import 'package:ctsefinalapp/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_service.dart';

class AuthenticationService {

  //firebase auth object
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on firebaseuser
  User _userFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // GET UID
  Future<String> getCurrentUID() async {
    return (await _auth.currentUser()).uid;
  }

     getCurrentUser() async {
    final FirebaseUser user = await _auth.currentUser();
    String uid = user.uid;
    // Similarly we can get email as well
    final uemail = user.email;
    return uid;
  }

  //auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
        .map(_userFirebaseUser);
  }

  //sign in with email & password
  Future signIn(String email, String password) async {
    try{
      AuthResult authResult = await _auth.signInWithEmailAndPassword(email: email,password: password);
      FirebaseUser user = authResult.user;
      return _userFirebaseUser(user);
    }catch(exception){
      print(exception.toString());
      return null;
    }
  }

  //register with email & password
  Future signUp(String fName, String email, String password) async {
    try{
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(email: email,password: password);
      FirebaseUser user = authResult.user;
      UserProfile users = UserProfile(email: email,fullName: fName);

      await FirestoreService(userId: user.uid).addUsers(users);
      return _userFirebaseUser(user);
    }catch(exception){
      print(exception.toString());
      return null;
    }
  }
  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(exception){
      print(exception.toString());
      return null;
    }
  }
}
