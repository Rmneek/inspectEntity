import 'dart:io';
import 'package:country_state_city/country_state_city.dart' as csc;
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

  bool autoValidate = false;
  bool isProcessing = false;

  String? errorMessage;

  final personalKey = GlobalKey<FormState>();
  final professionalKey = GlobalKey<FormState>();
  final serviceAreaKey = GlobalKey<FormState>();
  final additionalKey = GlobalKey<FormState>();

  Future<void> init() async {
    // await loadSavedData();
  }

  void notify() {
    notifyListeners();
  }

  //--------------------------- Persistance data--------------------------------------------------//

  SignupStep userCurrentStep = SignupStep.personal;
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

  void goNext() => inspectorPersistanceDataService.goNext();

  void goToPrevious() => inspectorPersistanceDataService.goToPrevious();

  void goToStep(int index) => inspectorPersistanceDataService.goToStep(index);

  Future<void> onNextPressed(BuildContext context) async =>
      inspectorPersistanceDataService.onNextPressed(context);

  //--------------------------- Personal data--------------------------------------------------//

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  void toggleObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  //--------------------------- Professional data --------------------------------------------------//

  CertificateInspectorTypeEntity? selectedCertificate;
  String? selectedCertificateId;
  List<File> documents = [];
  List<String> existingDocumentUrls = [];
  DateTime certificateExpiryDateShow = DateTime.now().add(Duration(days: 30));
  String certificateExpiryDate = '';
  List<String> uploadedCertificateUrls = [];

  String? certificateTypeError;
  String? expiryDateError;
  String? documentError;

  void setCertificateType(CertificateInspectorTypeEntity? t) =>
      professionalDetailServices.setCertificateType(t);

  bool validateProfessionalDetails() =>
      professionalDetailServices.validateProfessionalDetails();

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

  void setDate(DateTime d) => professionalDetailServices.setDate(d);

  void removeDocumentAt(int index) =>
      professionalDetailServices.removeDocumentAt(index);

  void removeExistingDocumentAt(int index) =>
      professionalDetailServices.removeExistingDocumentAt(index);

  //--------------------------- Service area data --------------------------------------------------//

  String? selectedCountryCode;
  String? selectedStateCode;
  List<String> selectedCityNames = [];
  List<csc.Country>? cachedCountries;
  Map<String, List<csc.State>> cachedStates = {};
  Map<String, List<csc.City>> cachedCities = {};
  String country = '';
  String state = '';
  List<String> cities = [];
  List<String> selectedCities = [];
  String? countryCode;
  String? stateCode;
  String? countryError;
  String? stateError;
  String? cityError;
  String? iccError;
  String? mailingAddressError;
  // final Map<String, List<IccDocumentLocalEntity>> iccLocalFiles = {};
  final Map<String, List<String>> iccUploadedUrls = {};
  Map<String, String> iccExpiryDates = {};
  // Map<String, List<IccUiDocument>> iccDocsByCity = {};


  

  //--------------------------- Additional data --------------------------------------------------//
}
