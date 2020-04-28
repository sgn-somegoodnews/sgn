import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  String headline;
  String subheadline;
  DateTime timestamp;
  String image;
  String text;

  News.fromJson(Map<String, dynamic> json) {
    
    print(json.keys.toList().join(" - "));
    
    this.headline = json['headline'];
    this.subheadline = json['subheadline'];
    this.timestamp = (json['timestamp'] as Timestamp).toDate();
    this.image = json['image'];
    this.text = json['text'];
  }
}
