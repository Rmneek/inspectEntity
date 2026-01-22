import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_text_widget.dart';
import 'package:inspect_connect/core/utils/constants/app_colors.dart';
import 'package:inspect_connect/core/utils/helpers/responsive_ui_helper/responsive_config.dart';

class CommonAuthBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget form;
  final String image;
  final bool showBackButton;
  final Function()? onBackPressed;
  final ResponsiveUiConfig rc;
  const CommonAuthBar({
    required this.title,
    required this.subtitle,
    required this.form,
    required this.image,
    required this.showBackButton,
    this.onBackPressed,
    required this.rc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: rc.screenWidth,
                  height: (rc.screenHeight * 0.35).clamp(300, double.infinity),
                  child: Image.asset(
                    image,
                    width: rc.screenWidth,
                    height: (rc.screenHeight * 0.35).clamp(
                      300,
                      double.infinity,
                    ),

                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: rc.screenWidth,
                  height: (rc.screenHeight * 0.35).clamp(300, double.infinity),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.black.withValues(alpha: 0.2),
                        AppColors.transparent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: showBackButton ? 26 : 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      showBackButton
                          ? IconButton(
                              icon: Icon(Icons.arrow_back),
                              color: AppColors.whiteColor,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          : SizedBox(),
                      SizedBox(height: 4),
                      textWidget(
                        text: subtitle,
                        fontSize: 14,
                        color: AppColors.white70Color,
                      ),
                      textWidget(
                        text: title,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: form,
            ),
          ],
        ),
      ),
    );
  }
}
