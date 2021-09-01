import 'package:triathlon_app/models/Distance.dart';
import 'package:triathlon_app/models/HeartRate.dart';

class Training {
  final String name;
  final Distance distance;
 
  final Duration swimDuration;
  final Duration bikeDuration;
  final Duration runDuration;

  final HeartRate swimHeartRate;
  final HeartRate bikeHeartRate;
  final HeartRate runHeartRate;

  const Training({
    required this.name,
    required this.distance,
    required this.swimDuration,
    required this.bikeDuration,
    required this.runDuration,
    required this.swimHeartRate,
    required this.bikeHeartRate,
    required this.runHeartRate
  });

}