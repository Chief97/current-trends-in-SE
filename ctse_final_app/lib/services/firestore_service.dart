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



  //user list from snapshot
//List <UserProfile> _userListFormSnapshot(QuerySnapshot snapshot){
//    return snapshot.documents.map((doc){
//      return UserProfile(
//        email: doc.data['email'] ?? '',
//        fullName:  doc.data['fullName'] ?? '',
//      );
//    }).toList();
//}

  Stream<QuerySnapshot> get UserData{
    return _usersCollectionReference.snapshots();
  }

}