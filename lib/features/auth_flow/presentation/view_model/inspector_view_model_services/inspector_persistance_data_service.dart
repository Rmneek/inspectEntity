import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/helpers/app_logger/app_logger.dart';
import 'package:inspect_connect/features/auth_flow/domain/enums/inspector_sing_up_step_enum.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model.dart';

class InspectorPersistanceDataService {
  final InspectorViewModelProvider vm;
  InspectorPersistanceDataService(this.vm);

  void goNext() {
    if (vm.userCurrentStep.index < SignupStep.values.length - 1) {
      vm.userCurrentStep = SignupStep.values[vm.userCurrentStep.index + 1];
      vm.notify();
    }
  }

  void goToPrevious() {
    if (vm.userCurrentStep.index > 0 && SignupStep.values.isNotEmpty) {
      vm.userCurrentStep = SignupStep.values[vm.userCurrentStep.index - 1];
      vm.notify();
    }
  }

  void goToStep(int index) {
    if (index >= 0 && index < SignupStep.values.length) {
      vm.userCurrentStep = SignupStep.values[index];
      vm.notify();
    }
  }

  void enableAutoValidate() {
    vm.autoValidate = true;
    vm.notify();
  }

  Future<void> onNextPressed(BuildContext context) async {
    final form = vm.currentFormKey.currentState;

    if (!(form?.validate() ?? false)) {
      enableAutoValidate();
      return;
    }

    form?.save();

    vm.isProcessing = true;
    vm.notify();

    switch (vm.userCurrentStep) {
      case SignupStep.personal:
        // await savePersonalStep();
        break;

      case SignupStep.professional:
        if (!vm.validateProfessionalDetails()) {
          AppLogger.info('invalidated');

          vm.isProcessing = false;
          vm.notify();
          return;
        }
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

    vm.isProcessing = false;
    vm.notify();

    if (vm.userCurrentStep.index < SignupStep.values.length - 1) {
      goNext();
    } else {
      // signUp(context: context);
    }
  }
}
