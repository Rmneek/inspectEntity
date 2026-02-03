import 'package:equatable/equatable.dart';

class GeoLocationEntity extends Equatable {
  final String locationName;
  final double latitude;
  final double longitude;

  const GeoLocationEntity({
    required this.locationName,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object> get props => [locationName, latitude, longitude];
}
