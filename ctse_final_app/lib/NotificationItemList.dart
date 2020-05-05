import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctsefinalapp/models/notificationModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import  'services/notification_services.dart';
import 'package:ctsefinalapp/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobile_popup/mobile_popup.dart';
import 'package:mobile_popup/pop_up.dart';
import 'Animation/Fade_Animation.dart';


class notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: notificationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class notificationPage extends StatefulWidget {
  @override
  _notificationPageState createState() => _notificationPageState();


}

class _notificationPageState extends State<notificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: _buildBody(context)),

    );
  }



  Widget _buildBody(BuildContext context) {

    final NotificationKey = GlobalKey<FormState>();
    double width;

    //text field state
    String title = '';
    String text = '';
    String error = '';
    HeaderDesign(context);
    return StreamBuilder<QuerySnapshot>(
      stream: NotificationFireBaseAPIServices.NotificationStream,
      builder: (context, snapshot) {
        HeaderDesign(context);
        if (!snapshot.hasData) return LinearProgressIndicator();
        if (snapshot.data.documents.length > 0) {
          return SingleChildScrollView(

              physics: BouncingScrollPhysics(),
              child:FadeAnimation(1, Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    HeaderDesign(context),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "  There are ${snapshot.data.documents.length.toString()} Notification",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    NotificationList(context, snapshot.data.documents),
                    SizedBox(height: 10),

                    FlatButton.icon(
                      icon: Icon(Icons.add),
                      label: Text('Add'),
                      color: Colors.orangeAccent,
                      textColor: Colors.black,

                      // Popup will be called by using showMobilePopup()
                      onPressed: () {
                        showMobilePopup(
                          context: context,
                          builder: (context) => MobilePopUp(
                            title: 'Add Notification Details',
                            child: Builder(
                              builder: (navigator) => Scaffold(
                                body: SingleChildScrollView(
                                  child: Form(
                                    key: NotificationKey,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: TextFormField(
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            validator: (value) => value.isEmpty ? 'Enter Title' : null,
                                            onChanged: (value){
                                              setState(() => title = value );
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.redAccent
                                                    )
                                                ),
                                                labelText: 'Title :',
                                                labelStyle: TextStyle(fontSize: 20,
                                                    color: Colors.black)
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: TextFormField(
                                            maxLines: 3,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            validator: (value) => value.isEmpty ? 'Enter Message' : null,
                                            onChanged: (value){
                                              setState(() => text = value );
                                            },
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Message',
                                                prefixIcon: Icon(Icons.notification_important),
                                                labelStyle: TextStyle(
                                                    fontSize: 15
                                                )
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.all(30),
                                          child: MaterialButton(
                                            onPressed: () async {
                                              if(NotificationKey.currentState.validate()) {
                                                dynamic result = NotificationFireBaseAPIServices.addNotification(title, text);
                                                if (result == null) {
                                                  setState(() => error ='Error');
                                                }
                                                else {
                                                  // showToast();
                                                }
                                              }
                                            },
                                            child: Text('Add Notification',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'SFUIDisplay',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white
                                              ),
                                            ),
                                            color: Color(0xffff2d55),
                                            elevation: 0,
                                            minWidth: 350,
                                            height: 60,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50)
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                  ],
                ),
              )
              )
          );
        } else {
          return Center(
            child: Text(
              "There is No Notification Yet",
              style: Theme.of(context).textTheme.title,
            ),
          );
        }
      },
    );
  }

  Widget NotificationList(
      BuildContext context, List<DocumentSnapshot> snapshot) {

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => NotificationitemList(context, data)).toList(),

    );
  }



  Widget NotificationitemList(BuildContext context, DocumentSnapshot data) {

    final notifications = notificationModel.fromSnapshot(data);
    final NotificationKey = GlobalKey<FormState>();
    String title = '';
    String text = '';
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      child: Slidable.builder(
        actionPane: SlidableDrawerActionPane(),
        secondaryActionDelegate: new SlideActionBuilderDelegate(
            actionCount: 2,
            builder: (context, index, animation, renderingMode) {
              if (index == 0) {
                return new IconSlideAction(
                  caption: 'Edit',
                  color: Colors.blue,
                  icon: Icons.edit,
                   onTap: ()=>showMobilePopup(
                  context: context,
                  builder: (context) => MobilePopUp(
                    title: 'Add Notification Details',
                    child: Builder(
                      builder: (navigator) => Scaffold(
                        body: SingleChildScrollView(
                          child: Form(
                            key: NotificationKey,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: TextFormField(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    validator: (value) => value.isEmpty ? 'Enter Title' : null,
                                    onChanged: (value){
                                      setState(() => title = value );
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.redAccent
                                            )
                                        ),
                                        labelText: 'Title :',
                                        labelStyle: TextStyle(fontSize: 20,
                                            color: Colors.black)
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: TextFormField(
                                    maxLines: 3,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    validator: (value) => value.isEmpty ? 'Enter Message' : null,
                                    onChanged: (value){
                                      setState(() => text = value );
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Message',
                                        prefixIcon: Icon(Icons.notification_important),
                                        labelStyle: TextStyle(
                                            fontSize: 15
                                        )
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(30),
                                  child: MaterialButton(
                                    onPressed: () async {
                                      if(NotificationKey.currentState.validate()) {
                                        dynamic result = NotificationFireBaseAPIServices.updateNotification(data.documentID,title, text);
                                        if (result == null) {
                                          setState(() => 'Error');
                                        }
                                        else {
                                          showToast();
                                        }
                                      }
                                    },
                                    child: Text('Update Notification ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'SFUIDisplay',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),
                                    color: Color(0xffff2d55),
                                    elevation: 0,
                                    minWidth: 350,
                                    height: 60,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ));
              }else {
                return new IconSlideAction(
                  caption: 'Delete',
                  closeOnTap: true,
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () =>
                      ConfirmationDialog(context, data.documentID),
                );
              }
            }),

        key: Key(notifications.title),
        child: ListTile(
          title: Text(notifications.title),
          subtitle: Text(notifications.text),
          onTap: () => print(notifications),
        ),
      ),

    );

  }

  Future<bool> ConfirmationDialog(
      BuildContext context, String documentID) {
      return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete'),
          content: Text('Notification will be deleted'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            FlatButton(
                child: Text('Delete'),
                onPressed: () {
                  NotificationFireBaseAPIServices.removeNotification(documentID);
                  Navigator.of(context).pop(true);
                }),
          ],
        );
      },
    );
  }



  Widget HeaderDesign(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 180,
          width: width,
          decoration: BoxDecoration(
            color: LightColor.orange,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 10,
                  right: -120,
                  child: circleContainer(300, LightColor.lightOrange2)),
              Positioned(
                  top: -60,
                  left: -65,
                  child: circleContainer(width * .5, LightColor.darkOrange)),
              Positioned(
                  top: 50,
                  left: 0,
                  child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Notifications",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ))),
            ],
          )),
    );
  }

  Widget circleContainer(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  //Toast Function Implementation
  void showToast() {
    Fluttertoast.showToast(
        msg: 'Updated Successfully ',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.pinkAccent,
        textColor: Colors.white
    );
  }




}
