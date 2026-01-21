class AuthUserEntity {
  final String id;
  final int role;
  final int status;
  final String authToken;
  final String name;
  final bool? phoneOtpVerified;

  AuthUserEntity({
    required this.id,
    required this.role,
    required this.status,
    required this.authToken,
    required this.name,
    this.phoneOtpVerified,
  });

  bool get isInspector => role == 2;
  bool get isActive => status == 1;
}
