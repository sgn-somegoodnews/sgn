
import 'package:cloud_firestore/cloud_firestore.dart';

class Story {
  bool isActive;
  String shortTitle;
  String title;
  String body;
  DateTime timestamp;
  String link;
  String image;
  String callToAction;


  Story.fromJson(Map<String, dynamic> json) {
    this.isActive = (json['IsAtivo'] == 'true');
    this.title = json['Title'];
    this.shortTitle = json['shortTitle'];
    this.body = json['Body'];
    this.timestamp = (json['Timestamp'] as Timestamp).toDate();
    this.link = json['Link'];
    this.image = json['Image'];
    this.callToAction = json['CallToAction'];
  }
}