import 'package:flutter/material.dart';
import 'package:triathlon_app/models/HeartRate.dart';
import 'package:triathlon_app/extensions/FormattedDuration.dart';
import 'package:triathlon_app/widgets/HeartRateChart.dart';

class TrainingTileSummary extends StatelessWidget {

  final String title;
  final Duration duration;
  final HeartRate heartRate;

  const TrainingTileSummary({ Key? key, required this.title, required this.duration, required this.heartRate }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),),
        ListTile(leading: Icon(Icons.timer), title: Text(duration.formatted)),
        ListTile(leading: Icon(Icons.favorite_outline), title: Text(heartRate.average.toStringAsFixed(2) + ' bpm')),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 25, 25, 10),
          child: HeartRateChart(heartRate: heartRate),
        ),
      ],
    );
  }
}