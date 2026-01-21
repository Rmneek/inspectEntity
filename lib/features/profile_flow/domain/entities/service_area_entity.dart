import 'package:inspect_connect/features/profile_flow/domain/entities/location_entity.dart';

class ServiceAreaEntity {
  final String id;
  final LocationEntity location;
  final String countryCode;
  final String stateCode;
  final String cityName;

  const ServiceAreaEntity({
    required this.id,
    required this.location,
    required this.countryCode,
    required this.stateCode,
    required this.cityName,
  });
}
