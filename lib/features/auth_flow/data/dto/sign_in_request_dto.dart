import 'package:inspect_connect/features/auth_flow/domain/params/sign_in_params.dart';

class SignInRequestDto {
  final String email;
  final String password;
  final String deviceToken;
  final String deviceType;

  SignInRequestDto({
    required this.email,
    required this.password,
    required this.deviceToken,
    required this.deviceType,
  });
  factory SignInRequestDto.fromParams(SignInParams params) {
    return SignInRequestDto(
      email: params.email,
      password: params.password,
      deviceToken: params.deviceToken,
      deviceType: params.deviceType,
    );
  }
  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "deviceToken": deviceToken,
    "deviceType": deviceType,
  };
}
