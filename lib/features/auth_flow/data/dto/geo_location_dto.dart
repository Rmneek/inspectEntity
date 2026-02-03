import 'package:inspect_connect/features/auth_flow/domain/entities/geo_location_entity.dart';

class GeoLocationDto {
  final String locationName;
  final double latitude;
  final double longitude;

  GeoLocationDto({
    required this.locationName,
    required this.latitude,
    required this.longitude,
  });

  factory GeoLocationDto.fromEntity(GeoLocationEntity entity) {
    return GeoLocationDto(
      locationName: entity.locationName,
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }

  Map<String, dynamic> toJson() => {
        "type": "Point",
        "locationName": locationName,
        "coordinates": [latitude, longitude],
      };
}
