import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:triathlon_app/models/Distance.dart';
import 'package:triathlon_app/models/HeartRate.dart';
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


    final Random random = new Random();
    final randomHeartRate = () => HeartRate({
      Duration(minutes: 0): 60 + random.nextInt(140),
      Duration(minutes: 1): 60 + random.nextInt(140),
      Duration(minutes: 2): 60 + random.nextInt(140),
      Duration(minutes: 3): 60 + random.nextInt(140),
      Duration(minutes: 4): 60 + random.nextInt(140),
      Duration(minutes: 5): 60 + random.nextInt(140),
      Duration(minutes: 6): 60 + random.nextInt(140),
      Duration(minutes: 7): 60 + random.nextInt(140),
      Duration(minutes: 8): 60 + random.nextInt(140),
      Duration(minutes: 9): 60 + random.nextInt(140),
      Duration(minutes: 10): 60 + random.nextInt(140),
    });

    final HeartRate swimHeartRate = randomHeartRate();
    final HeartRate bikeHeartRate = randomHeartRate();
    final HeartRate runHeartRate = randomHeartRate();

    final Training training = new Training(
      name: "Training #${i + 1}",
      distance: olimpicDistance,
      swimDuration: Duration(minutes: 10),
      bikeDuration: Duration(minutes: 10),
      runDuration: Duration(minutes: 10),
      swimHeartRate: swimHeartRate,
      bikeHeartRate: bikeHeartRate,
      runHeartRate: runHeartRate,
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