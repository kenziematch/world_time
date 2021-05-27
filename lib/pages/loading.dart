import 'package:flutter/material.dart';
import 'package:worldtime_app2/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    WorldTime region = WorldTime(location:'seoul', flag: 'korea.png', url: 'Asia/seoul');
  await region.getTime();
Navigator.pushReplacementNamed(context, '/home', arguments: {
  'location' : region.location,
  'flag' : region.flag,
  'time' : region.time,
  'isDaytime' : region.isDaytime,
});

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[200],
      body: Center(
         child: SpinKitChasingDots(
            color: Colors.white,
            size: 100.0,
          ),
      ),
    );
  }
}
