import 'package:cloud_firestore/cloud_firestore.dart';

//create Notification Services
//ref:- https://flutterawesome.com/a-flutter-application-that-demonstrate-simple-crud-operations/
class NotificationFireBaseAPIServices {
  static Stream<QuerySnapshot> notificationStream =
  Firestore.instance.collection('notification').snapshots();


  //Created Collection for notification
  static CollectionReference reference =
  Firestore.instance.collection('notification');


  //Add notification method
  static addNotification(String title,String text) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.add({
        "title" :title,
        "text": text,
      });
    });
  }

  //Remove Notification By using ID
  static removeNotification(String id) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.document(id).delete().catchError((error) {
        print(error);
      });
    });
  }

  //Update Notification method
  static updateNotification(String id, String newTitle,String newText) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.document(id).updateData({
        "title":newTitle,
        "text": newText,
      }).catchError((error) {
        print(error);
      });
    });
  }

}
