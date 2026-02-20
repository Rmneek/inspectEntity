import 'package:flutter/material.dart';
import 'package:country_state_city/country_state_city.dart' as csc;
import 'package:inspect_connect/core/utils/app_presentation/app_common_text_widget.dart';
import 'package:inspect_connect/core/utils/constants/app_colors.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/inspector_widgets/country_state_cities_dialog.dart';

class MultiCityPicker extends StatelessWidget {
  final List<String> selectedCities;
  final List<csc.City> cities;
  final int maxSelection;
  final Function(List<String>) onSelectionChanged;
  final String? errorText;

  const MultiCityPicker({
    super.key,
    required this.selectedCities,
    required this.cities,
    required this.maxSelection,
    required this.onSelectionChanged,
    this.errorText,
  });

  void openDialog(BuildContext context) async {
    final selected = await showMultiSelectSearchDialog<csc.City>(
      context: context,
      items: cities,
      itemAsString: (c) => c.name,
      title: selectCities,
      initiallySelected: cities.where((c) => selectedCities.contains(c.name)).toList(),
    );

    if (selected.length <= maxSelection) {
      onSelectionChanged(selected.map((c) => c.name).toList());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Maximum $maxSelection cities allowed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final limitReached = maxSelection > 0 && selectedCities.length >= maxSelection;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget(text: selectCities),
            GestureDetector(
              onTap: limitReached ? null : () => openDialog(context),
              child: textWidget(
                text: addEdit,
                color: limitReached ? Colors.grey : AppColors.authThemeColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: selectedCities.map((city) => Chip(label: textWidget(text: city))).toList(),
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
