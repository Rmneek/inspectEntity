import 'package:inspect_connect/core/commondomain/entities/based_api_result/api_result_model.dart';
import 'package:inspect_connect/core/commondomain/usecases/base_params_usecase.dart';
import 'package:inspect_connect/features/auth_flow/domain/entities/auth_user_entity.dart';
import 'package:inspect_connect/features/auth_flow/domain/params/sign_in_params.dart';
import 'package:inspect_connect/features/auth_flow/domain/repositories/auth_repository.dart';

class SignInUseCase extends BaseParamsUseCase<AuthUserEntity, SignInParams> {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<ApiResultModel<AuthUserEntity>> call(SignInParams? params) {
    return repository.signIn(params!);
  }
}
