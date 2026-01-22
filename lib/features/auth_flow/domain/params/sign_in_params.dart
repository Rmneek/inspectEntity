import 'package:equatable/equatable.dart';

class SignInParams extends Equatable {
  final String email;
  final String password;
  final String deviceToken;
  final String deviceType;

  const SignInParams({
    required this.email,
    required this.password,
    required this.deviceToken,
    required this.deviceType,
  });

  @override
  List<Object?> get props => [email, password, deviceToken, deviceType];
}
