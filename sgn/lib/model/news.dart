import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  String headline;
  String subheadline;
  DateTime timestamp;
  String image;
  String text;
  String url;

  News.fromJson(Map<String, dynamic> json) {

    this.headline = json['headline'] ?? "No title";
    this.subheadline = json['subheadline'] ?? "";
    this.timestamp = (json['timestamp'] as Timestamp).toDate();
    this.image = json['image'];
    this.text = json['text'];
    this.url = json['url'];

    assert(headline != null);
    assert(subheadline != null);
    assert(timestamp != null);
    assert(image != null);
    assert(text != null);
    assert(url != null);
  }
}
