import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:triathlon_app/models/Distance.dart';
import 'package:triathlon_app/models/Training.dart';
import 'package:triathlon_app/screens/TrainingDetails.dart';

class TrainingLog extends StatefulWidget {
  const TrainingLog({ Key? key }) : super(key: key);

  @override
  _TrainingLogState createState() => _TrainingLogState();
}

final f = new DateFormat('dd/MM/yyyy HH:mm');

class _TrainingLogState extends State<TrainingLog> {

  final date = f.format(DateTime.now());

  void openDetails(int i) {

    final HeartRate heartRate = {
      Duration(seconds: 0): 100,
      Duration(minutes: 1): 120,
      Duration(minutes: 10): 150,
    };

    final Training training = new Training(
      name: "Training #${i + 1}",
      distance: olimpicDistance,
      swimDuration: Duration(minutes: 10),
      bikeDuration: Duration(minutes: 5),
      runDuration: Duration(minutes: 9),
      swimHeartRate: heartRate,
      bikeHeartRate: heartRate,
      runHeartRate: heartRate
    );

    Navigator.of(context).push(new MaterialPageRoute(builder: (c) => TrainingDetails(training: training)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Training log"),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, i) => ListTile(
          title: Text("Training #${i + 1}"),
          subtitle: Text(date),
          onTap: () => openDetails(i),
        ),
      ),
    );
  }
}