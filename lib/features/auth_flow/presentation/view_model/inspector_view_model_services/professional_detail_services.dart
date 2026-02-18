import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/core/utils/helpers/app_logger/app_logger.dart';
import 'package:inspect_connect/core/utils/toast_service/toast_service.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model.dart';
import 'package:inspect_connect/features/common_features/data/dto/upload_image_dto.dart';
import 'package:inspect_connect/features/common_features/domain/entities/certificate_type_entity.dart';

class ProfessionalDetailServices {
  final InspectorViewModelProvider vm;
  ProfessionalDetailServices(this.vm);

  void setCertificateType(CertificateInspectorTypeEntity? t) {
    vm.selectedCertificate = t;
    vm.selectedCertificateId = t?.id;
    AppLogger.info('------------id. ${t!.id.toString()}');
    AppLogger.info('------------name. ${t.name.toString()}');

    vm.notify();
  }

  void setDate(DateTime d) {
    vm.certificateExpiryDateShow = DateTime(d.year, d.month, d.day);
    vm.certificateExpiryDate = vm.certificateExpiryDateShow
        .toIso8601String()
        .split('T')
        .first;
    vm.notify();
  }

  void removeDocumentAt(int index) {
    if (index < vm.uploadedCertificateUrls.length) {
      vm.uploadedCertificateUrls.removeAt(index);
    }
    if (index < vm.documents.length) {
      vm.documents.removeAt(index);
    }
    vm.notify();
  }

  void removeExistingDocumentAt(int index) {
    vm.existingDocumentUrls.removeAt(index);
    vm.uploadedCertificateUrls.removeAt(index);
    vm.notify();
  }
}
