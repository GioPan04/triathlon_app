import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:triathlon_app/models/HeartRate.dart';

class HeartRateChart extends StatelessWidget {

  final HeartRate heartRate;

  const HeartRateChart({ Key? key, required this.heartRate }) : super(key: key);

  List<FlSpot> get _getSpots {
    return heartRate.data.entries
      .map<FlSpot>((e) => FlSpot(e.key.inSeconds.toDouble() ,e.value.toDouble()))
      .toList();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LineChart(
        LineChartData(
          minY: 60,
          maxY: 200,
          lineBarsData: [
            LineChartBarData(
              spots: _getSpots
            )
          ],
          lineTouchData: LineTouchData(
            handleBuiltInTouches: false
          ),
          titlesData: FlTitlesData(
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: (s) {
                final Duration dur = new Duration(seconds: s.toInt());
                return dur.inMinutes.toString();
              }
            )
          )
        ),
      ),
    );
  }
}