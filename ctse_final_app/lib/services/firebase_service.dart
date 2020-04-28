import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctsefinalapp/models/lectureModel.dart';
import 'package:ctsefinalapp/models/userProfile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

class FirestoreService {

  final String userId;

  FirestoreService({this.userId});

  final CollectionReference _usersCollectionReference = Firestore.instance
      .collection('users');
  final CollectionReference _lecturesCollectionReference = Firestore.instance
      .collection('lectures');
  final StorageReference _storageRef = FirebaseStorage.instance.ref();


  Future addUsers(UserProfile user) async {
    return await _usersCollectionReference.document(userId).setData({
      'email': user.email,
      'fullName': user.fullName,
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

  Stream<QuerySnapshot> get getUserData {
    return _usersCollectionReference.snapshots();
  }

  Future uploadLectureFile(LectureModel lecture, File tempFile) async {
    final document = await _lecturesCollectionReference.add({
      'week': lecture.week,
      'lectureTitle': lecture.lectureTitle,
      'lecturerName': lecture.lecturerName,
    });
    print(document.documentID);


    final StorageUploadTask uploadTask = _storageRef.child(document.documentID)
        .putFile(tempFile);
    return uploadTask.isComplete;
  }


}