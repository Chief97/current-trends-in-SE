import 'package:cloud_firestore/cloud_firestore.dart';

class notificationModel {
  String title;
  final String text;
  final DocumentReference reference;

  //notificationModel( {this.title,this.text});
  notificationModel.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['text'] != null),
        title=map['text'],
        text = map['text'];

  notificationModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => text;
  String toStrings() => title;
}