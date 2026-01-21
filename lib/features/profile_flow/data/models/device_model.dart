import 'package:inspect_connect/features/profile_flow/domain/entities/device_entity.dart';

class DeviceModel extends DeviceEntity {
  DeviceModel({required super.deviceToken, required super.deviceType});

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      deviceToken: json['deviceToken'],
      deviceType: json['deviceType'],
    );
  }
}
