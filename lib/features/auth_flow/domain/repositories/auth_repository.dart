import 'package:inspect_connect/core/commondomain/entities/based_api_result/api_result_model.dart';
import 'package:inspect_connect/features/auth_flow/domain/entities/auth_user_entity.dart';
import 'package:inspect_connect/features/auth_flow/domain/params/sign_in_params.dart';

abstract class AuthRepository {
  Future<ApiResultModel<AuthUserEntity>> signIn(SignInParams params);
}
