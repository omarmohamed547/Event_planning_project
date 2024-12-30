import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String? id;
  String image;
  String eventName;
  String title;
  String desc;
  DateTime dateTime;
  String time;
  bool isFavourite;
  static const String collectionName = "Event";

  EventModel({
    required this.desc,
    required this.eventName,
    required this.title,
    required this.time,
    required this.dateTime,
    required this.image,
    this.isFavourite = false,
    this.id,
  });

  //obj=>json
  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "image": image,
      "desc": desc,
      "title": title,
      "time": time,
      "dateTime": dateTime.millisecondsSinceEpoch,
      "isFavourite": isFavourite,
      "eventName": eventName,
    };
  }

  //json to obj
  EventModel.fromFireStore(Map<String, dynamic>? data)
      : this(
          id: data!['id'],
          time: data["time"],
          desc: data["desc"],
          title: data["title"],
          dateTime: DateTime.fromMillisecondsSinceEpoch(data["dateTime"]),
          eventName: data["eventName"],
          isFavourite: data["isFavourite"],
          image: data["image"],
        );
}
