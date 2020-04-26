import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctsefinalapp/models/userProfile.dart';
import 'package:flutter/services.dart';

class FirestoreService {

  final String userId;
  FirestoreService({this.userId});

  final CollectionReference _usersCollectionReference = Firestore.instance.collection('users');


  Future addUsers(UserProfile user ) async{
    return await _usersCollectionReference.document(userId).setData({
      'email' : user.email,
      'fullName' : user.fullName,
    });
//    try {
//      await _usersCollectionReference.add(user.toMap());
//    }catch(e){
//      if(e is PlatformException){
//        return e.message;
//      }
//      return e.toString();
//    }
  }
}