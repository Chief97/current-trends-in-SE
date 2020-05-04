import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctsefinalapp/models/lectureModel.dart';
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
  final CollectionReference _labCollectionReference = Firestore.instance
      .collection('labs');
  final StorageReference _storageRef = FirebaseStorage.instance.ref();
  final String _type = "lectures";
  DocumentReference _document;
  StorageUploadTask _uploadTask;
  StorageReference _fileRef;
  String _downloadURL;


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

  Future uploadFile(LectureModel lecture,String type, File tempFile) async {
    if(type == _type) {
      _document = await _lecturesCollectionReference.add({
        'id': _document.documentID,
        'week': lecture.week,
        'title': lecture.title,
        'lecturerName': lecture.lecturerName,
      });
    }else{
        _document = await _labCollectionReference.add({
          'id': _document.documentID,
          'week': lecture.week,
          'title': lecture.title,
          'lecturerName': lecture.lecturerName,
        });
    }
    print(_document.documentID);
//    _fileRef = ;

     _uploadTask = _storageRef.child(type+'/'+_document.documentID).putFile(tempFile);
     return _uploadTask.isComplete;
//    if(_uploadTask.isComplete){
//      return downloadFile(type, _document.documentID);
//    }else{
//      await _uploadTask.isComplete;
//      return downloadFile(type, _document.documentID);
//    }
  }
  Future<String> downloadFile(String type,dynamic ref) async {
    if(type == _type) {
//      DocumentSnapshot value = await _lecturesCollectionReference.document(ref)
//          .get();
      _downloadURL = await _storageRef.child(type+'/'+ref).getDownloadURL();
      return _downloadURL;
    } else{
//      DocumentSnapshot value = await _labCollectionReference.document(ref)
//          .get();
      _downloadURL = await _storageRef.child(type+'/'+ref).getDownloadURL();
      return _downloadURL;
    }
  }

  getLecturesData() async {
    return await _lecturesCollectionReference.snapshots();
  }

  getLabsData() async {
    return await _labCollectionReference.snapshots();
  }

}