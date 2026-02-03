import 'package:equatable/equatable.dart';
import 'package:inspect_connect/features/auth_flow/domain/entities/geo_location_entity.dart';

class ClientSignUpParams extends Equatable {
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
  final GeoLocationEntity location;

  const ClientSignUpParams({
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

  @override
  List<Object?> get props => [
    role,
    email,
    name,
    phoneNumber,
    countryCode,
    password,
    deviceToken,
    deviceType,
    mailingAddress,
    zip,
    agreedToTerms,
    isTruthfully,
    location,
  ];
}
