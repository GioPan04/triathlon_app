import 'dart:math';

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

  factory Training.random(String? name) {
    final Random random = new Random();

    final int swimDuration = random.nextInt(50);
    final int runDuration = random.nextInt(50);
    final int bikeDuration = random.nextInt(50);

    final HeartRate swimHeartRate = HeartRate.random(swimDuration);
    final HeartRate bikeHeartRate = HeartRate.random(bikeDuration);
    final HeartRate runHeartRate = HeartRate.random(runDuration);

    return new Training(
      name: name ?? "Training",
      distance: olimpicDistance,
      swimDuration: Duration(minutes: swimDuration),
      bikeDuration: Duration(minutes: bikeDuration),
      runDuration: Duration(minutes: runDuration),
      swimHeartRate: swimHeartRate,
      bikeHeartRate: bikeHeartRate,
      runHeartRate: runHeartRate,
    );
  }

}