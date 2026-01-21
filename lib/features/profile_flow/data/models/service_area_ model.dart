import 'package:inspect_connect/features/profile_flow/data/models/location_model.dart';
import 'package:inspect_connect/features/profile_flow/domain/entities/service_area_entity.dart';

class ServiceAreaModel extends ServiceAreaEntity {
  ServiceAreaModel({
    required super.id,
    required super.location,
    required super.countryCode,
    required super.stateCode,
    required super.cityName,
  });

  factory ServiceAreaModel.fromJson(Map<String, dynamic> json) {
    return ServiceAreaModel(
      id: json['_id'],
      location: LocationModel.fromJson(json['location']),
      countryCode: json['countryCode'],
      stateCode: json['stateCode'],
      cityName: json['cityName'],
    );
  }
}
