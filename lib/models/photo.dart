import 'package:flutter/material.dart';

class Photo {
  String id;
  String description;
  String thumbnail;

  Photo(
      {@required this.id,
      @required this.description,
      @required this.thumbnail});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'] ?? '';
    thumbnail = json['urls']['thumb'];
  }
}
