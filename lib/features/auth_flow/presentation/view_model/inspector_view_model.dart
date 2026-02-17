import 'package:flutter/material.dart';
import 'package:inspect_connect/core/basecomponents/base_view_model.dart';
import 'package:inspect_connect/features/auth_flow/domain/enums/inspector_sing_up_step_enum.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model_services/additional_detail_services.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model_services/personal_detail_services.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model_services/professional_detail_services.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model_services/service_area_services.dart';

class InspectorViewModelProvider extends BaseViewModel {
  InspectorViewModelProvider() {
    personalDetailServices = PersonalDetailServices(this);
    professionalDetailServices = ProfessionalDetailServices(this);
    serviceAreaService = ServiceAreaServices(this);
    additionalDetailService = AdditionalDetailServices(this);
  }
  late final PersonalDetailServices personalDetailServices;
  late final ProfessionalDetailServices professionalDetailServices;
  late final ServiceAreaServices serviceAreaService;
  late final AdditionalDetailServices additionalDetailService;

  SignupStep userCurrentStep = SignupStep.personal;

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

  void goNext() {
    if (userCurrentStep.index < SignupStep.values.length - 1) {
      userCurrentStep = SignupStep.values[userCurrentStep.index + 1];
      notifyListeners();
    }
  }

  void goToPrevious() {
    if (userCurrentStep.index > 0 && SignupStep.values.isNotEmpty) {
      userCurrentStep = SignupStep.values[userCurrentStep.index - 1];
      notifyListeners();
    }
  }

  void goToStep(int index) {
    if (index >= 0 && index < SignupStep.values.length) {
      userCurrentStep = SignupStep.values[index];
      notifyListeners();
    }
  }

  void enableAutoValidate() {
    autoValidate = true;
    notifyListeners();
  }

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

  Future<void> onNextPressed(BuildContext context) async {
    final form = currentFormKey.currentState;

    if (!(form?.validate() ?? false)) {
      enableAutoValidate();
      return;
    }

    form?.save();

    isProcessing = true;
    notifyListeners();

    switch (userCurrentStep) {
      case SignupStep.personal:
        // await savePersonalStep();
        break;

      case SignupStep.professional:
        // if (!validateProfessionalDetails()) {
        //   isProcessing = false;
        //   notifyListeners();
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text(errorMessage ?? SignupStrings.invalidInput)),
        //   );
        //   return;
        // }

        // await saveProfessionalStep(
        //   certificateTypeId: selectedCertificateTypeId ?? '',
        //   certificateExpiryDate:
        //       certificateExpiryDate != '' ? certificateExpiryDate : '',
        //   uploadedCertificateUrls: uploadedCertificateUrls,
        //   agencyIds: selectedAgencyIds,
        // );
        break;

      case SignupStep.serviceArea:
        // if (!validateServiceArea()) {
        //   isProcessing = false;
        //   notifyListeners();
        //   return;
        // }

        // saveSelectedServiceDataToProvider();

        // await generateServiceAreas(
        //   countryCode: countryCode.toString(),
        //   stateCode: stateCode.toString(),
        //   selectedCities: selectedCities,
        // );

        // await saveServiceAreaStep(
        //   country: country,
        //   state: state,
        //   city: city ?? '',
        //   mailingAddress: mailingAddress,
        //   zipCode: zipCode,
        //   serviceAreas: serviceAreas,
        // );
        break;

      case SignupStep.additional:
        // validateBeforeSubmit(context: context);
        // if (!agreedToTerms || !confirmTruth) {
        //   isProcessing = false;
        //   notifyListeners();
        //   return;
        // }

        // await saveAdditionalStep(
        //   profileImageUrlOrPath: profileImageUrl?.toString(),
        //   idLicenseUrlOrPath: idDocumentUploadedUrl?.toString(),
        //   referenceDocs: referenceLetters.map((e) => e.path).toList(),
        //   agreed: agreedToTerms,
        //   truthful: confirmTruth,
        //   workHistoryDescription: inspWorkHistoryController.text,
        // );
        break;
    }

    isProcessing = false;
    notifyListeners();

    if (userCurrentStep.index < SignupStep.values.length - 1) {
      goNext();
    } else {
      // signUp(context: context);
    }
  }

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  void toggleObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }
}
