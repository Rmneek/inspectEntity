import 'package:inspect_connect/features/profile_flow/domain/entities/certificate_type_entity.dart';

class CertificateTypeModel extends CertificateTypeEntity {
  CertificateTypeModel({
    required super.id,
    required super.name,
    required super.status,
  });

  factory CertificateTypeModel.fromJson(Map<String, dynamic> json) {
    return CertificateTypeModel(
      id: json['_id'],
      name: json['name'],
      status: json['status'],
    );
  }
}
