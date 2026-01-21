import 'package:inspect_connect/features/profile_flow/data/models/certificate_type_model.dart';
import 'package:inspect_connect/features/profile_flow/data/models/current_subscription_model.dart';
import 'package:inspect_connect/features/profile_flow/data/models/device_model.dart';
import 'package:inspect_connect/features/profile_flow/data/models/document_type_model.dart';
import 'package:inspect_connect/features/profile_flow/data/models/location_model.dart';
import 'package:inspect_connect/features/profile_flow/data/models/service_area_%20model.dart';
import 'package:inspect_connect/features/profile_flow/data/models/upload_document_model.dart';
import 'package:inspect_connect/features/profile_flow/data/models/user_document_model.dart';
import 'package:inspect_connect/features/profile_flow/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.role,
    required super.email,
    required super.profileImage,
    required super.name,
    required super.status,
    required super.statusUpdatedByAdmin,
    required super.phoneNumber,
    required super.countryCode,
    required super.bookingInProgress,
    required super.isDeleted,
    required super.country,
    required super.state,
    required super.city,
    required super.zip,
    required super.location,
    required super.uploadedIdOrLicenseDocument,
    required super.serviceAreas,
    required super.mailingAddress,
    required super.certificateTypeId,
    required super.certificateDocuments,
    required super.certificateExpiryDate,
    required super.documentTypeId,
    required super.documentExpiryDate,
    required super.coiExpiryDate,
    required super.referenceDocuments,
    required super.workHistoryDescription,
    required super.phoneOtpVerified,
    required super.emailOtpVerified,
    required super.agreedToTerms,
    required super.isTruthfully,
    required super.loginTime,
    required super.stripeSubscriptionStatus,
    required super.currentSubscriptionId,
    required super.currentSubscriptionTrialDays,
    required super.currentSubscriptionAutoRenew,
    required super.certificateApproved,
    required super.rejectedReason,
    required super.stripeAccountId,
    required super.connectorLinkUrl,
    required super.walletId,
    required super.stripePayoutsEnabled,
    required super.stripeTransfersEnabled,
    required super.socketId,
    required super.docxOk,
    required super.privateTempId,
    required super.stripeConnectStatus,
    required super.devices,
    required super.createdAt,
    required super.updatedAt,
    required super.stripeCustomerId,
    required super.documents,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      role: json['role'],
      email: json['email'],
      profileImage: json['profileImage'],
      name: json['name'],
      status: json['status'],
      statusUpdatedByAdmin: json['statusUpdatedByAdmin'],
      phoneNumber: json['phoneNumber'],
      countryCode: json['countryCode'],
      bookingInProgress: json['bookingInProgress'],
      isDeleted: json['isDeleted'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      zip: json['zip'],
      location: LocationModel.fromJson(json['location']),
      uploadedIdOrLicenseDocument: UploadDocumentModel.fromJson(
        json['uploadedIdOrLicenseDocument'],
      ),
      serviceAreas: (json['serviceAreas'] as List)
          .map((e) => ServiceAreaModel.fromJson(e))
          .toList(),
      mailingAddress: json['mailingAddress'],
      certificateTypeId: CertificateTypeModel.fromJson(
        json['certificateTypeId'],
      ),
      certificateDocuments: (json['certificateDocuments'] as List)
          .cast<String>(),
      certificateExpiryDate: json['certificateExpiryDate'],
      documentTypeId: CommonDocumentTypeModel.fromJson(json['documentTypeId']),
      documentExpiryDate: json['documentExpiryDate'],
      coiExpiryDate: json['coiExpiryDate'],
      referenceDocuments: (json['referenceDocuments'] as List).cast<String>(),
      workHistoryDescription: json['workHistoryDescription'],
      phoneOtpVerified: json['phoneOtpVerified'],
      emailOtpVerified: json['emailOtpVerified'],
      agreedToTerms: json['agreedToTerms'],
      isTruthfully: json['isTruthfully'],
      loginTime: json['loginTime'],
      stripeSubscriptionStatus: json['stripeSubscriptionStatus'],
      currentSubscriptionId: CurrentSubscriptionModel.fromJson(
        json['currentSubscriptionId'],
      ),
      currentSubscriptionTrialDays: json['currentSubscriptionTrialDays'],
      currentSubscriptionAutoRenew: json['currentSubscriptionAutoRenew'],
      certificateApproved: json['certificateApproved'],
      rejectedReason: json['rejectedReason'],
      stripeAccountId: json['stripeAccountId'],
      connectorLinkUrl: json['connectorLinkUrl'],
      walletId: json['walletId'],
      stripePayoutsEnabled: json['stripePayoutsEnabled'],
      stripeTransfersEnabled: json['stripeTransfersEnabled'],
      socketId: json['socketId'],
      docxOk: json['docxOk'],
      privateTempId: json['privateTempId'],
      stripeConnectStatus: json['stripeConnectStatus'],
      devices: (json['devices'] as List)
          .map((e) => DeviceModel.fromJson(e))
          .toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      stripeCustomerId: json['stripeCustomerId'],
      documents: (json['documents'] as List)
          .map((e) => UserDocumentModel.fromJson(e))
          .toList(),
    );
  }
}
