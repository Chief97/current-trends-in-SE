import 'package:cloud_firestore/cloud_firestore.dart';

//Creating Notification Model

class notificationModel {
  String title;
  final String text;
  final DocumentReference reference;



  notificationModel.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),assert(map['text'] != null),
        title=map['title'],
        text = map['text'];



  notificationModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data);


}