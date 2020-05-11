import 'package:dio/dio.dart';
import 'dart:convert';
import '../models/photo.dart';
import 'config.dart';

final Dio dio = Dio(
  BaseOptions(baseUrl: 'https://api.unsplash.com', headers: {
    "Authorization": 'Client-ID $KEY',
  }, queryParameters: {
    'per_page': 10,
    // 'orientation': 'landscape'
  }),
);

Future<List<Photo>> getPhotosByCollection(String collectionID,
    {int page = 1}) async {
  final Response response =
      await dio.get('/collections/$collectionID/photos?page=$page');
  print(response);
  final List<dynamic> data = response.data;
  return data.map((photo) => Photo.fromJson(photo)).toList();
}
