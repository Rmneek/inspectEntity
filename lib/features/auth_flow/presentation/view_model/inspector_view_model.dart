import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inspect_connect/core/basecomponents/base_view_model.dart';
import 'package:inspect_connect/features/auth_flow/domain/enums/inspector_sing_up_step_enum.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model_services/additional_detail_services.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model_services/inspector_persistance_data_service.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model_services/personal_detail_services.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model_services/professional_detail_services.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model_services/service_area_services.dart';
import 'package:inspect_connect/features/common_features/domain/entities/certificate_type_entity.dart';

class InspectorViewModelProvider extends BaseViewModel {
  InspectorViewModelProvider() {
    personalDetailServices = PersonalDetailServices(this);
    professionalDetailServices = ProfessionalDetailServices(this);
    serviceAreaService = ServiceAreaServices(this);
    additionalDetailService = AdditionalDetailServices(this);
    inspectorPersistanceDataService = InspectorPersistanceDataService(this);
  }
  late final PersonalDetailServices personalDetailServices;
  late final ProfessionalDetailServices professionalDetailServices;
  late final ServiceAreaServices serviceAreaService;
  late final AdditionalDetailServices additionalDetailService;
  late final InspectorPersistanceDataService inspectorPersistanceDataService;

  SignupStep userCurrentStep = SignupStep.personal;

  bool autoValidate = false;
  bool isProcessing = false;

  String? errorMessage;

  final personalKey = GlobalKey<FormState>();
  final professionalKey = GlobalKey<FormState>();
  final serviceAreaKey = GlobalKey<FormState>();
  final additionalKey = GlobalKey<FormState>();

  CertificateInspectorTypeEntity? selectedCertificate;
  String? selectedCertificateId;

  Future<void> init() async {
    // await loadSavedData();
  }
  void notify() {
    notifyListeners();
  }

  void goNext() => inspectorPersistanceDataService.goNext();

  void goToPrevious() => inspectorPersistanceDataService.goToPrevious();

  void goToStep(int index) => inspectorPersistanceDataService.goToStep(index);

  GlobalKey<FormState> get currentFormKey {
    switch (userCurrentStep) {
      case SignupStep.personal:
        return personalKey;
      case SignupStep.professional:
        return professionalKey;
      case SignupStep.serviceArea:
        return serviceAreaKey;
      case SignupStep.additional:
        return additionalKey;
    }
  }

  Future<void> onNextPressed(BuildContext context) async =>
      inspectorPersistanceDataService.onNextPressed(context);

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  void toggleObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void setCertificateType(CertificateInspectorTypeEntity? t) =>
      professionalDetailServices.setCertificateType(t);

  void initializeCertificate(
    String savedId,
    List<CertificateInspectorTypeEntity> list,
  ) {
    selectedCertificate = list.firstWhere(
      (e) => e.id == savedId,
      orElse: () => list.first,
    );

    selectedCertificateId = selectedCertificate?.id;
    notifyListeners();
  }

  List<File> documents = [];
  List<String> existingDocumentUrls = [];
  DateTime certificateExpiryDateShow = DateTime.now().add(Duration(days: 30));
  String certificateExpiryDate = '';
  void setDate(DateTime d) => professionalDetailServices.setDate(d);

  void removeDocumentAt(int index) =>
      professionalDetailServices.removeDocumentAt(index);

  void removeExistingDocumentAt(int index) =>
      professionalDetailServices.removeExistingDocumentAt(index);

  List<String> uploadedCertificateUrls = [];
}
