import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:inspect_connect/core/commondomain/entities/based_api_result/api_result_model.dart';
import 'package:inspect_connect/core/commondomain/entities/based_api_result/error_result_model.dart';
import 'package:inspect_connect/core/utils/constants/app_constants.dart';
import 'package:inspect_connect/core/utils/helpers/http_strategy_helper/concrete_strategies/post_request_strategy.dart';
import 'package:inspect_connect/core/utils/helpers/http_strategy_helper/http_request_context.dart';
import 'package:inspect_connect/features/auth_flow/data/dto/client_sign_up_request_dto.dart';
import 'package:inspect_connect/features/auth_flow/data/dto/sign_in_request_dto.dart';
import 'package:inspect_connect/features/auth_flow/data/models/auth_user_model.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResultModel<AuthUserModel>> signIn(SignInRequestDto dto);
  Future<ApiResultModel<AuthUserModel>> clientSignUp(ClientSignUpRequestDto dto);

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final HttpRequestContext _ctx;

  AuthRemoteDataSourceImpl(this._ctx);

  @override
  Future<ApiResultModel<AuthUserModel>> signIn(SignInRequestDto dto) async {
    try {
      final ApiResultModel<http.Response> res = await _ctx.makeRequest(
        uri: signInEndPoint,
        httpRequestStrategy: PostRequestStrategy(),
        requestData: dto.toJson(),
      );
      return res.when(
        success: (http.Response response) {
          final Map<String, dynamic> root = response.body.isEmpty
              ? {}
              : (jsonDecode(response.body) as Map<String, dynamic>);
          final Map<String, dynamic> body =
              (root['body'] as Map?)?.cast<String, dynamic>() ??
              <String, dynamic>{};
          log('--------------->body$body');
          final data = AuthUserModel.fromJson(body);
          return ApiResultModel<AuthUserModel>.success(data: data);
        },
        failure: (ErrorResultModel e) =>
            ApiResultModel<AuthUserModel>.failure(errorResultEntity: e),
      );
    } catch (e) {
      log('autoremoteresopoonse------> $e');
      return const ApiResultModel.failure(
        errorResultEntity: ErrorResultModel(
          message: "Network error occurred",
          statusCode: 500,
        ),
      );
    }
  }

@override
  Future<ApiResultModel<AuthUserModel>> clientSignUp(ClientSignUpRequestDto dto) async {
    try {
      final ApiResultModel<http.Response> res = await _ctx.makeRequest(
        uri: signUpEndPoint,
        httpRequestStrategy: PostRequestStrategy(),
        requestData: dto.toJson(),
      );
      return res.when(
        success: (http.Response response) {
          final Map<String, dynamic> root = response.body.isEmpty
              ? {}
              : (jsonDecode(response.body) as Map<String, dynamic>);
          final Map<String, dynamic> body =
              (root['body'] as Map?)?.cast<String, dynamic>() ??
              <String, dynamic>{};
          log('--------------->body$body');
          final data = AuthUserModel.fromJson(body);
          return ApiResultModel<AuthUserModel>.success(data: data);
        },
        failure: (ErrorResultModel e) =>
            ApiResultModel<AuthUserModel>.failure(errorResultEntity: e),
      );
    } catch (e) {
      log('autoremoteresopoonse------> $e');
      return const ApiResultModel.failure(
        errorResultEntity: ErrorResultModel(
          message: "Network error occurred",
          statusCode: 500,
        ),
      );
    }
  }


}
