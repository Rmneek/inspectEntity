import 'package:inspect_connect/core/commondomain/entities/based_api_result/api_result_model.dart';
import 'package:inspect_connect/core/commondomain/usecases/base_params_usecase.dart';
import 'package:inspect_connect/features/auth_flow/domain/entities/auth_user_entity.dart';
import 'package:inspect_connect/features/auth_flow/domain/params/client_sign_up_params.dart';
import 'package:inspect_connect/features/auth_flow/domain/repositories/auth_repository.dart';

class ClientSignUpUsecase
    extends BaseParamsUseCase<AuthUserEntity, ClientSignUpParams> {
  final AuthRepository _repo;
  ClientSignUpUsecase(this._repo);

  @override
  Future<ApiResultModel<AuthUserEntity>> call(ClientSignUpParams? params) {
    return _repo.clientSignUp(params!);
  }
}
