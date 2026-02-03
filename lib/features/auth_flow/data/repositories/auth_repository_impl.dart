import 'package:inspect_connect/core/commondomain/entities/based_api_result/api_result_model.dart';
import 'package:inspect_connect/features/auth_flow/data/datasources/remote_datasources/auth_remote_data_source.dart';
import 'package:inspect_connect/features/auth_flow/data/dto/client_sign_up_request_dto.dart';
import 'package:inspect_connect/features/auth_flow/data/dto/sign_in_request_dto.dart';
import 'package:inspect_connect/features/auth_flow/domain/entities/auth_user_entity.dart';
import 'package:inspect_connect/features/auth_flow/domain/params/client_sign_up_params.dart';
import 'package:inspect_connect/features/auth_flow/domain/params/sign_in_params.dart';
import 'package:inspect_connect/features/auth_flow/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  AuthRepositoryImpl(this._remote);
  @override
  Future<ApiResultModel<AuthUserEntity>> signIn(SignInParams params) async {
    final dto = SignInRequestDto.fromParams(params);
    final result = await _remote.signIn(dto);

    return result.when(
      success: (model) => ApiResultModel<AuthUserEntity>.success(data: model),
      failure: (e) =>
          ApiResultModel<AuthUserEntity>.failure(errorResultEntity: e),
    );
  }

 @override
   Future<ApiResultModel<AuthUserEntity>> clientSignUp( ClientSignUpParams params) async {
    final dto = ClientSignUpRequestDto.fromParams(params);
    final result = await _remote.clientSignUp(dto);

    return result.when(
      success: (model) => ApiResultModel<AuthUserEntity>.success(data: model),
      failure: (e) =>
          ApiResultModel<AuthUserEntity>.failure(errorResultEntity: e),
    );
  }
}
