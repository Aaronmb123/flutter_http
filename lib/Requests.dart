
import 'dart:convert';

import 'package:http/http.dart';

import 'models/Album.dart';

Future<Album> fetchAlbum() async {
  final response =
      await get('https://jsonplaceholder.typicode.com/albums/1');
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Album> deleteAlbum(String id) async {
  final Response response = await delete(
    'https://jsonplaceholder.typicode.com/albums/$id',
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if(response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete album.');
  }

}