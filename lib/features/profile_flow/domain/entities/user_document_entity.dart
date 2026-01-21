import 'package:inspect_connect/features/profile_flow/domain/entities/document_type_entity.dart';

class UserDocumentEntity {
  final String id;
  final CommonDocumentTypeEntity documentTypeId;
  final String fileUrl;
  final String expiryDate;
  final int adminApproval;
  final String? adminNotes;
  final String? serviceCity;
  final String fileName;

  const UserDocumentEntity({
    required this.id,
    required this.documentTypeId,
    required this.fileUrl,
    required this.expiryDate,
    required this.adminApproval,
    required this.adminNotes,
    required this.serviceCity,
    required this.fileName,
  });
}
