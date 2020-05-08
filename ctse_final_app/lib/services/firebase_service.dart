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
  static String _typ = "lectures";
  static CollectionReference _lectureRef = Firestore.instance
      .collection('lectures');
  static CollectionReference _labRef = Firestore.instance
      .collection('labs');
  static StorageReference _storageStatic = FirebaseStorage.instance.ref();
  DocumentReference _document;
  StorageUploadTask _uploadTask;
  static StorageUploadTask _uploadStatic;
  StorageReference _fileRef;
  String _downloadURL;
  String _dateTimeNow;

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

//Uploading a data to the collection and file to the storage
  Future uploadFile(LectureModel lecture, String type, File tempFile) async {
    _dateTimeNow = DateTime.now().toString();
    if (type == _type) {
      await _lecturesCollectionReference.document(_dateTimeNow).setData({
        'id': _dateTimeNow,
        'week': lecture.week,
        'title': lecture.title,
        'lecturerName': lecture.lecturerName,
      });

      //await _lecturesCollectionReference.document(_document.documentID).updateData({'id':_document.documentID});
    } else {
      await _labCollectionReference.document(_dateTimeNow).setData({
        'id': _dateTimeNow,
        'week': lecture.week,
        'title': lecture.title,
        'lecturerName': lecture.lecturerName,
      });
//        await _labCollectionReference.document(_document.documentID).updateData({'id':_document.documentID});
    }

    _uploadTask =
        _storageRef.child(type + '/' + _dateTimeNow).putFile(tempFile);
    return _uploadTask.isComplete;
//    if(_uploadTask.isComplete){
//      return downloadFile(type, _document.documentID);
//    }else{
//      await _uploadTask.isComplete;
//      return downloadFile(type, _document.documentID);
//    }
  }

  //Download files from storage
  Future<String> downloadFile(String type, dynamic ref) async {
    if (type == "lecture") {
//      DocumentSnapshot value = await _lecturesCollectionReference.document(ref)
//          .get();
      _downloadURL = await _storageRef.child(type + '/' + ref).getDownloadURL();
      return _downloadURL;
    } else {
//      DocumentSnapshot value = await _labCollectionReference.document(ref)
//          .get();
      _downloadURL = await _storageRef.child(type + '/' + ref).getDownloadURL();
      return _downloadURL;
    }
  }

//get data from lecture collection
  getLecturesData() async {
    return await _lecturesCollectionReference.snapshots();
  }

//get data from lab collection
  getLabsData() async {
    return await _labCollectionReference.snapshots();
  }

  static updateDetails(LectureModel lecture, String id, String type, File tempFile) async {
    print('method called');
    // ignore: missing_return
    Firestore.instance.runTransaction((Transaction transaction) async {
    if (type == _typ) {
      await _lectureRef.document(id).updateData({
        'week': lecture.week,
        'title': lecture.title,
        'lecturerName': lecture.lecturerName,
      }).catchError((error) {
        print(error);
      });
    } else {
      await _labRef.document(id).updateData({
        'week': lecture.week,
        'title': lecture.title,
        'lecturerName': lecture.lecturerName,
      }).catchError((error) {
        print(error);
      });
      if (tempFile != null) {
        _storageStatic.child(type + '/' + id).delete();
        _uploadStatic = _storageStatic.child(type + '/' + id).putFile(tempFile);
        return _uploadStatic.isComplete;
      }
    }
    });
  }

  static deleteData(String id, String type) async {
    Firestore.instance.runTransaction((Transaction transaction) async {
      print('method called');
      if(type == _typ){
        await _lectureRef.document(id).delete().catchError((error) {
          print(error);
        });
      }else{
        await _labRef.document(id).delete().catchError((error) {
          print(error);
        });
      }
      _storageStatic.child(type + '/' + id).delete();
      print('method executed');
    });
  }
}