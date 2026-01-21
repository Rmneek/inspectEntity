import 'package:inspect_connect/features/profile_flow/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    required super.type,
    required super.locationName,
    required super.coordinates,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      type: json['type'],
      locationName: json['locationName'],
      coordinates: (json['coordinates'] as List<double>)
          .map((e) => e.toDouble())
          .toList(),
    );
  }
}
