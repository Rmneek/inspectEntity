import 'package:inspect_connect/features/profile_flow/domain/entities/location_entity.dart';
import 'package:inspect_connect/features/profile_flow/domain/entities/service_area_entity.dart';
import 'package:inspect_connect/features/profile_flow/domain/entities/upload_document_entity.dart';
import 'package:inspect_connect/features/profile_flow/domain/entities/certificate_type_entity.dart';
import 'package:inspect_connect/features/profile_flow/domain/entities/current_subscription_entity.dart';
import 'package:inspect_connect/features/profile_flow/domain/entities/device_entity.dart';
import 'package:inspect_connect/features/profile_flow/domain/entities/document_type_entity.dart';
import 'package:inspect_connect/features/profile_flow/domain/entities/user_document_entity.dart';

class UserEntity {
  final String id;
  final int role;
  final String email;
  final String profileImage;
  final String name;
  final int status;
  final bool statusUpdatedByAdmin;
  final String phoneNumber;
  final String countryCode;
  final bool bookingInProgress;
  final bool isDeleted;
  final String country;
  final String state;
  final String city;
  final String zip;
  final LocationEntity location;
  final UploadDocumentEntity uploadedIdOrLicenseDocument;
  final List<ServiceAreaEntity> serviceAreas;
  final String mailingAddress;
  final CertificateTypeEntity certificateTypeId;
  final List<String> certificateDocuments;
  final String certificateExpiryDate;
  final CommonDocumentTypeEntity documentTypeId;
  final String documentExpiryDate;
  final String coiExpiryDate;
  final List<String> referenceDocuments;
  final String workHistoryDescription;
  final bool phoneOtpVerified;
  final bool emailOtpVerified;
  final bool agreedToTerms;
  final bool isTruthfully;
  final String? loginTime;
  final String stripeSubscriptionStatus;
  final CurrentSubscriptionEntity currentSubscriptionId;
  final int currentSubscriptionTrialDays;
  final int currentSubscriptionAutoRenew;
  final int certificateApproved;
  final String? rejectedReason;
  final String? stripeAccountId;
  final String? connectorLinkUrl;
  final String walletId;
  final bool stripePayoutsEnabled;
  final bool stripeTransfersEnabled;
  final String? socketId;
  final bool docxOk;
  final String privateTempId;
  final String? stripeConnectStatus;
  final List<DeviceEntity> devices;
  final String createdAt;
  final String updatedAt;
  final String stripeCustomerId;
  final List<UserDocumentEntity> documents;

  const UserEntity({
    required this.id,
    required this.role,
    required this.email,
    required this.profileImage,
    required this.name,
    required this.status,
    required this.statusUpdatedByAdmin,
    required this.phoneNumber,
    required this.countryCode,
    required this.bookingInProgress,
    required this.isDeleted,
    required this.country,
    required this.state,
    required this.city,
    required this.zip,
    required this.location,
    required this.uploadedIdOrLicenseDocument,
    required this.serviceAreas,
    required this.mailingAddress,
    required this.certificateTypeId,
    required this.certificateDocuments,
    required this.certificateExpiryDate,
    required this.documentTypeId,
    required this.documentExpiryDate,
    required this.coiExpiryDate,
    required this.referenceDocuments,
    required this.workHistoryDescription,
    required this.phoneOtpVerified,
    required this.emailOtpVerified,
    required this.agreedToTerms,
    required this.isTruthfully,
    required this.loginTime,
    required this.stripeSubscriptionStatus,
    required this.currentSubscriptionId,
    required this.currentSubscriptionTrialDays,
    required this.currentSubscriptionAutoRenew,
    required this.certificateApproved,
    required this.rejectedReason,
    required this.stripeAccountId,
    required this.connectorLinkUrl,
    required this.walletId,
    required this.stripePayoutsEnabled,
    required this.stripeTransfersEnabled,
    required this.socketId,
    required this.docxOk,
    required this.privateTempId,
    required this.stripeConnectStatus,
    required this.devices,
    required this.createdAt,
    required this.updatedAt,
    required this.stripeCustomerId,
    required this.documents,
  });
}
