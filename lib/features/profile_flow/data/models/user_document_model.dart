import 'package:inspect_connect/features/profile_flow/data/models/document_type_model.dart';
import 'package:inspect_connect/features/profile_flow/domain/entities/user_document_entity.dart';

class UserDocumentModel extends UserDocumentEntity {
  UserDocumentModel({
    required super.id,
    required super.documentTypeId,
    required super.fileUrl,
    required super.expiryDate,
    required super.adminApproval,
    required super.adminNotes,
    required super.serviceCity,
    required super.fileName,
  });

  factory UserDocumentModel.fromJson(Map<String, dynamic> json) {
    return UserDocumentModel(
      id: json['_id'],
      documentTypeId: CommonDocumentTypeModel.fromJson(json['documentTypeId']),
      fileUrl: json['fileUrl'],
      expiryDate: json['expiryDate'],
      adminApproval: json['adminApproval'],
      adminNotes: json['adminNotes'],
      serviceCity: json['serviceCity'],
      fileName: json['fileName'],
    );
  }
}
