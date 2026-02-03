import 'package:inspect_connect/features/auth_flow/data/dto/geo_location_dto.dart';
import 'package:inspect_connect/features/auth_flow/domain/params/client_sign_up_params.dart';

class ClientSignUpRequestDto {
  final int role;
  final String email;
  final String name;
  final String phoneNumber;
  final String countryCode;
  final String password;
  final String deviceToken;
  final String deviceType;
  final String mailingAddress;
  final String zip;
  final bool agreedToTerms;
  final bool isTruthfully;
  final GeoLocationDto location;

  ClientSignUpRequestDto({
    required this.role,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.countryCode,
    required this.password,
    required this.deviceToken,
    required this.deviceType,
    required this.mailingAddress,
    required this.zip,
    required this.agreedToTerms,
    required this.isTruthfully,
    required this.location,
  });

  factory ClientSignUpRequestDto.fromParams(ClientSignUpParams params) {
    return ClientSignUpRequestDto(
      role: params.role,
      email: params.email,
      name: params.name,
      phoneNumber: params.phoneNumber,
      countryCode: params.countryCode,
      password: params.password,
      deviceToken: params.deviceToken,
      deviceType: params.deviceType,
      mailingAddress: params.mailingAddress,
      zip: params.zip,
      agreedToTerms: params.agreedToTerms,
      isTruthfully: params.isTruthfully,
      location: GeoLocationDto.fromEntity(params.location),
    );
  }

  Map<String, dynamic> toJson() => {
    "role": role,
    "email": email,
    "name": name,
    "phoneNumber": phoneNumber,
    "countryCode": countryCode,
    "password": password,
    "deviceToken": deviceToken,
    "deviceType": deviceType,
    "mailingAddress": mailingAddress,
    "zip": zip,
    "agreedToTerms": agreedToTerms,
    "isTruthfully": isTruthfully,
    "location": location.toJson(),
  };
}
