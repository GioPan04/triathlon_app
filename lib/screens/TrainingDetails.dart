import 'package:flutter/material.dart';
import 'package:triathlon_app/models/Training.dart';
import 'package:triathlon_app/widgets/HeartRateChart.dart';
import 'package:triathlon_app/extensions/FormattedDuration.dart';
import 'package:triathlon_app/widgets/TrainingTileSummary.dart';

class TrainingDetails extends StatefulWidget {

  final Training training;

  const TrainingDetails({ Key? key, required this.training }) : super(key: key);

  @override
  _TrainingDetailsState createState() => _TrainingDetailsState();
}

class _TrainingDetailsState extends State<TrainingDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.training.name),
      ),
      body: ListView(
        children: [
          TrainingTileSummary(title: 'Swim', duration: widget.training.swimDuration, heartRate: widget.training.swimHeartRate),
          Divider(),
          TrainingTileSummary(title: 'Bike', duration: widget.training.bikeDuration, heartRate: widget.training.bikeHeartRate),
          Divider(),
          TrainingTileSummary(title: 'Run', duration: widget.training.runDuration, heartRate: widget.training.runHeartRate),
        ],
      )
    );
  }
}