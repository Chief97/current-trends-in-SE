import 'package:flutter/foundation.dart';

class LectureModel {
//  final String userId;
  String _id;
  int week;
  String title;
  String lecturerName;

  LectureModel({
//    @required this.userId,
    @required this.week,
    @required this.title,
    @required this.lecturerName});
}

