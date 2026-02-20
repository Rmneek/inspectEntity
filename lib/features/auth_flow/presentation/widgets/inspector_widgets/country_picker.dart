import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_text_widget.dart';
import 'package:country_state_city/country_state_city.dart' as csc;
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/inspector_widgets/app_selector_field.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/inspector_widgets/country_state_cities_dialog.dart';


class CountrySelector extends StatelessWidget {
  final String? selectedCountry;
  final List<csc.Country> countries;
  final Function(csc.Country) onCountrySelected;
  final String? errorText;

  const CountrySelector({
    super.key,
    required this.selectedCountry,
    required this.countries,
    required this.onCountrySelected,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSelectorField(
          label: countryTxt,
          value: selectedCountry ?? defaultCountry,
          onTap: () async {
            final selected = await showSearchableListDialog<csc.Country>(
              context: context,
              items: countries,
              itemAsString: (c) => c.name,
              title: countryTxt,
            );
            if (selected != null) onCountrySelected(selected);
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

