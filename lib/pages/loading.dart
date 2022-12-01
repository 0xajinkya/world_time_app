import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final String baseUrl = 'https://worldtimeapi.org/api/timezone/';
  var client = Client();

  // Future<dynamic> getData(String baseUrl, String api) async {
  //   var url = Uri.parse(baseUrl + api);
  //
  //   Response response = await client.get(url);
  //   Map data = jsonDecode(response.body);
  //   print(data['title']);
  // }

  Future <dynamic> getTime(String api) async {
    var url = Uri.parse(baseUrl + api);
    Response response = await client.get(url);
    Map data = jsonDecode(response.body);
    // print(data);

    //Getting The Properties From Data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    // print(dateTime);
    // print(offset);

    //Create A DateTime Object
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState;
    getTime('Europe/London');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}
