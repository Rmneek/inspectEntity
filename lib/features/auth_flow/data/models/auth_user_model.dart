import 'package:inspect_connect/features/auth_flow/domain/entities/auth_user_entity.dart';

class AuthUserModel extends AuthUserEntity {
  AuthUserModel({
    required super.id,
    required super.role,
    required super.status,
    required super.authToken,
    required super.name,
    super.phoneOtpVerified,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['_id'],
      role: json['role'],
      status: json['status'],
      authToken: json['authToken'],
      phoneOtpVerified: json['phoneOtpVerified'],
      name: json['name'],
    );
  }
}
