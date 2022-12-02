import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart'
    '';
const String baseUrl = 'https://worldtimeapi.org/api/timezone/';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;

  var client = Client();

  WorldTime({required this.location, required this.flag, required this.url});

  Future<dynamic> getTime() async {
    try {
      var url = Uri.parse(baseUrl + this.url);
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
      print(now);
      now = now.add(Duration(hours: int.parse(offset)));

      //Setting the time property
      this.time = DateFormat.jm().format(now);
    } catch (e) {
      print("Caught Some Error $e");
      this.time = "Couldn't Get Time Data";
    }
  }
}
