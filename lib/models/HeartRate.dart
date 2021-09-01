import 'dart:math';

typedef HeartRateData = Map<Duration,int>;

class HeartRate {
  final HeartRateData data;

  const HeartRate(this.data);
  
  factory HeartRate.random(int minutes) {
    final Random random = new Random();
    final randomHeartValue = () => 60 + random.nextInt(140);

    HeartRateData heartRateData = {};

    for (var i = 0; i < minutes; i++) {
      heartRateData[Duration(minutes: i)] = randomHeartValue();
    }

    return HeartRate(heartRateData);
  }

  double get average {
    int sum = 0;
    int entries = 0;

    data.forEach((key, value) {
      sum += value;
      entries++;
    });

    return sum / entries;
  }

  
}