import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_text_style.dart';
import 'package:inspect_connect/core/utils/constants/app_colors.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';

class OnBoardingToggle extends StatelessWidget {
  final bool? isClient;
  final void Function(bool) onSelect;

  const OnBoardingToggle({
    required this.isClient,
    required this.onSelect,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.whiteColor, width: 1.2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: isClient == null
                  ? Alignment.center
                  : isClient!
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: isClient == null ? 0 : 125,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(isClient == true ? 0 : 30),
                    right: Radius.circular(isClient == true ? 30 : 0),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                _option(clientTxt, true),
                _option(inspectorTxt, false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _option(String title, bool value) {
    final selected = isClient == value;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onSelect(value),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            style: appTextStyle(
              color: selected ? AppColors.black : AppColors.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
