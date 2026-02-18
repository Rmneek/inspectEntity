import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_dropdown_widget.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/inspector_widgets/section_tile_widget.dart';
import 'package:inspect_connect/features/common_features/domain/entities/certificate_type_entity.dart';
import 'package:inspect_connect/features/common_features/presentation/common_upload_document_grid.dart';
import 'package:inspect_connect/features/common_features/presentation/date_time_picker_widget.dart';
import 'package:inspect_connect/features/common_features/view_model/common_view_model.dart';
import 'package:provider/provider.dart';

class ProfessionalDetailsScreen extends StatelessWidget {
  final InspectorViewModelProvider vm;
  final GlobalKey<FormState> formKey;
  const ProfessionalDetailsScreen(this.vm, this.formKey, {super.key});

  @override
  Widget build(BuildContext context) {
    final commonProvider = context.watch<CommonViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSection(
          title: professionalDetails,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        AppSection(
          title: certificateType,
          child: AppDropdown<CertificateInspectorTypeEntity>(
            value: vm.selectedCertificate,
            items: commonProvider.certificateType,
            hint: selectCertificateType,
            labelBuilder: (item) => item.name,
            onChanged: vm.setCertificateType,
          ),
        ),

        AppSection(
          title: selectExpirationDate,
          child: DateTimePickerWidget(
            showTimePicker: false,
            initialDateTime: vm.certificateExpiryDateShow,
            onDateTimeSelected: (dt) {
              vm.setDate(dt);
            },
          ),
        ),
        AppSection(title: uploadCertificationDocuments,
        child: CommonDocumentGrid(
  localFiles: vm.documents,
  networkUrls: vm.existingDocumentUrls,
  maxFiles: 4,
  onAddTap: () => commonProvider.uploadDocument(
    onSuccess: (file, url, picker) {
      vm.documents.add(file);
      vm.uploadedCertificateUrls.add(url);
      vm.notify();
    },
  ),
  onRemoveLocal: (index) => vm.removeDocumentAt(index),
  onRemoveNetwork: (index) => vm.removeExistingDocumentAt(index),
)
,
        )
      ],
    );
  }
}
