import 'package:flutter/material.dart';
import 'package:country_state_city/country_state_city.dart' as csc;
import 'package:inspect_connect/core/utils/app_presentation/app_common_text_widget.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/inspector_widgets/app_selector_field.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/inspector_widgets/country_state_cities_dialog.dart';

class StateSelector extends StatelessWidget {
  final String? selectedState;
  final List<csc.State> states;
  final Function(csc.State) onStateSelected;
  final String? errorText;

  const StateSelector({
    super.key,
    required this.selectedState,
    required this.states,
    required this.onStateSelected,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSelectorField(
          label: stateTxt,
          value: selectedState ?? defaultState,
          onTap: () async {
            if (states.isEmpty) return;
            final selected = await showSearchableListDialog<csc.State>(
              context: context,
              items: states,
              itemAsString: (s) => s.name,
              title: stateTxt,
            );
            if (selected != null) onStateSelected(selected);
          },
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: textWidget(
              text: errorText!,
              color: Colors.red,
              fontSize: 12,
            ),
          ),
      ],
    );
  }
}
