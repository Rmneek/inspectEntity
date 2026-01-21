import 'package:inspect_connect/features/profile_flow/domain/entities/document_type_entity.dart';

class CommonDocumentTypeModel extends CommonDocumentTypeEntity {
  CommonDocumentTypeModel({
    required super.id,
    required super.name,
    required super.status,
  });

  factory CommonDocumentTypeModel.fromJson(Map<String, dynamic> json) {
    return CommonDocumentTypeModel(
      id: json['_id'],
      name: json['name'],
      status: json['status'],
    );
  }
}
