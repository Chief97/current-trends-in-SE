import 'package:flutter/foundation.dart';

class UserProfile{
//  final String userId;
  final String email;
  final String fullName;

  UserProfile({
//    @required this.userId,
    @required this.email,
    @required this.fullName});

  getterFullName(){
    return this.fullName;
  }

  getterEmail(){
    return this.email;
  }

//  Map<String, dynamic> toMap() {
//    return {
////      'userId' : userId,
//      'email' : email,
//      'fullName': fullName,
//    };
//  }
//
//  static UserProfile fromMap(Map<String, dynamic> map) {
//    if(map == null) return null;
//
//    return UserProfile(
//      userId: map['userId'],
//      email: map['email'],
//      fullName: map['fullName'],
//    );
//  }
}