import 'package:cloud_firestore/cloud_firestore.dart';

class notificationModel {
  String title;
  final String text;
  final DocumentReference reference;

  //notificationModel( {this.title,this.text});

  notificationModel.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),assert(map['text'] != null),
        title=map['title'],
        text = map['text'];

//  notificationModel.fromMap(Map<String, dynamic> map, )
//      : assert(map['title'] != null),assert(map['text'] != null),
//        title=map['text'],
//        text = map['text'];

  notificationModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data);


//  @override
//  String toString() => title,text;
  //String toStrings() => title;
}