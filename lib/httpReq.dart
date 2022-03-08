import 'dart:async';
import 'dart:collection';
import 'dart:convert' as cnv;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'museumModel.dart';

Future<http.Response> fetchAlbum() async {
  final response = await http.get(
      Uri.parse(
          'https://collection.sciencemuseumgroup.org.uk/search/museum/science-museum?page[size]=5'),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return response;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class HttpService {
  final String getUrl =
      "https://collection.sciencemuseumgroup.org.uk/search/museum/science-museum?page[size]=5";
  //https://collection.sciencemuseumgroup.org.uk/search/museum/national-railway-museum
  //https://collection.sciencemuseumgroup.org.uk/search/museum/national-media-museum
}

class MuseumData extends StatefulWidget {
  @override
  _MuseumDataState createState() => _MuseumDataState();
}

class _MuseumDataState extends State<MuseumData> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Text('hello'));
    // TODO: implement build
    // throw UnimplementedError();
  }
}

Future<http.Response> getData() async {
  Uri url = Uri.https('collection.sciencemuseumgroup.org.uk',
      '/search/museum/science-museum?page[size]=5');
  http.Response res = await http.get(
      Uri.parse(
          'https://collection.sciencemuseumgroup.org.uk/search/museum/science-museum?page[size]=5'),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      });
  String jsonStr = res.body;
  // Map<String, dynamic> d = json.decode(jsonStr.trim());
  LinkedHashMap<String, dynamic> body = cnv.jsonDecode(res.body);
  String firstTitle = body['data'][0]['attributes']['summary_title'];
  // model = body
  //     .map((string data, dynamic items) => museumModel.fromJson(items))
  //     .toList();
  return res;
  // print(res.body);
}
