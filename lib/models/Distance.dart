class Distance {
  final String name;

  final double swimDistance;
  final double bikeDistance;
  final double runDistance;

  const Distance({
    required this.name,
    required this.swimDistance,
    required this.bikeDistance,
    required this.runDistance
  });
}

const Distance olimpicDistance = const Distance(name: 'Olimpic', swimDistance: 1.5, bikeDistance: 40, runDistance: 10);
const Distance ironManDistance = const Distance(name: 'Ironman', swimDistance: 3.8, bikeDistance: 180, runDistance: 42.195);
const Distance ironMan703Distance = const Distance(name: 'Ironman 70.3', swimDistance: 1.9, bikeDistance: 90, runDistance: 21.097);
