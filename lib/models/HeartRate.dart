typedef HeartRateData = Map<Duration,int>;

class HeartRate {
  final HeartRateData data;

  HeartRate(this.data);

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