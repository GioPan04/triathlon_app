import 'package:flutter/material.dart';
import 'package:triathlon_app/models/Distance.dart';
import 'package:triathlon_app/native/WatchChannel.dart';
import 'package:triathlon_app/screens/RunningPage.dart';
import 'package:triathlon_app/screens/TraningLogPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentDistance = 0;
  List<Distance> distances = [olimpicDistance, ironManDistance, ironMan703Distance];

  void start() {
    WatchChannel.sendString('bruh');
    Navigator.of(context).push(new MaterialPageRoute(builder: (c) => Running(distance: distances[currentDistance])));
  }

  void openLog() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (c) => TrainingLog()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<Distance>(
              value: distances[currentDistance],
              items: distances
                .map((e) => DropdownMenuItem(child: Text(e.name), value: e))
                .toList(),
              onChanged: (e) => setState(() => {
                currentDistance = distances.indexWhere((element) => element.name == e?.name)
              }),
            ),
            ElevatedButton(onPressed: start, child: Text("Start")),
            TextButton(onPressed: openLog, child: Text("Log")),
          ],
        )
      ),
    );
  }
}
