import 'package:flutter/material.dart';
import 'package:worldtime_app2/services/world_time.dart';

class ChangeLocation extends StatefulWidget {

  @override
  _ChangeLocationState createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
  WorldTime(url: 'Africa/Cotonou', location: 'Cotonou', flag: 'benin.jpg'),
  WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'korea.png'),
  WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
  WorldTime(url: 'Oceania/Sydney', location: 'Sydney', flag: 'aus.png'),
  WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.jpg'),
  WorldTime(url: 'Europe/Bavaria', location: 'Bavaria', flag: 'germany.png'),
  WorldTime(url: 'Asia/Maharashtra', location: 'Maharashtra', flag: 'india.jpg'),
  WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.jpg'),
  WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'uae.png'),
  ];

  void updateTime(index) async {
    WorldTime region = locations[index];
    await region.getTime();
    //navigate to home screen
Navigator.pop(context, {
  'location' : region.location,
  'flag' : region.flag,
  'time' : region.time,
  'isDaytime' : region.isDaytime,
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('change location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
      itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal:4.0 ),
              child: Card(
                child: ListTile(
                  onTap: () {
updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('images/${locations[index].flag}'),
                  ),
                ),
              ),
            );
      }),
    );
  }
}
