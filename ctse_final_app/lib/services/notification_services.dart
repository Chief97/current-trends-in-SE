import 'package:cloud_firestore/cloud_firestore.dart';


class NotificationFireBaseAPIServices {
  static Stream<QuerySnapshot> NotificationStream =
  Firestore.instance.collection('notification').snapshots();

  static CollectionReference reference =
  Firestore.instance.collection('notification');

  static addNotification(String title,String text) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.add({
        "title" :title,
        "text": text,
      });
    });
  }

  static removeNotification(String id) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.document(id).delete().catchError((error) {
        print(error);
      });
    });
  }

  static updateNotification(String id, String newTitle,String Newtext) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.document(id).updateData({
        "title":newTitle,
        "text": Newtext,
      }).catchError((error) {
        print(error);
      });
    });
  }

}
