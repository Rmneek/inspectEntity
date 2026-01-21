import 'package:inspect_connect/features/profile_flow/domain/entities/upload_document_entity.dart';

class UploadDocumentModel extends UploadDocumentEntity {
  UploadDocumentModel({required super.documentUrl, required super.fileName});

  factory UploadDocumentModel.fromJson(Map<String, dynamic> json) {
    return UploadDocumentModel(
      documentUrl: json['documentUrl'],
      fileName: json['fileName'],
    );
  }
}
