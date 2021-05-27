import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location ;//location name for the UI
String time ; //the time in that location
String flag ; //url to an asset flag icon
String url ; //this is the location url for api checkpoint
bool isDaytime ;//true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response answer =
      await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(answer.body);
      //print(data);

      //get properties for the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
// print(datetime);
// print(offset);

      //create a date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
print('caught error');
time = 'could not get time data';
    }
    //make request


  }

}


