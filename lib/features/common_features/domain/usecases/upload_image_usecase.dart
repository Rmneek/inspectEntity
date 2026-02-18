import 'package:inspect_connect/core/commondomain/entities/based_api_result/api_result_model.dart';
import 'package:inspect_connect/core/commondomain/usecases/base_params_usecase.dart';
import 'package:inspect_connect/features/common_features/domain/entities/upload_image_entity.dart';
import 'package:inspect_connect/features/common_features/domain/params/upload_image_params.dart';
import 'package:inspect_connect/features/common_features/domain/repositories/common_repository.dart';



class UploadImageUseCase
    extends BaseParamsUseCase<UploadImageEntity, UploadImageParams> {
  final CommonRepository _repo;
  UploadImageUseCase(this._repo);

  @override
  Future<ApiResultModel<UploadImageEntity>> call(UploadImageParams? p) =>
      _repo.uploadImage(uploadImageDto: p!.uploadImageDto);
}
