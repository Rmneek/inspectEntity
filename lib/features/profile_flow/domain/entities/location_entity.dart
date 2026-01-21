class LocationEntity {
  final String type;
  final String? locationName;
  final List<double> coordinates;

  const LocationEntity({
    required this.type,
    required this.locationName,
    required this.coordinates,
  });
}
