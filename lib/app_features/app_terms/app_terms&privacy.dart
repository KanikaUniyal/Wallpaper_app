import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:wallpaper/app_configuration/app_colors.dart';
// import 'package:wallpaper/app_configuration/app_texts.dart';
// import 'package:wallpaper/app_features/app_terms/app_policy.dart';
// import 'package:wallpaper/app_features/app_terms/pdf.dart';
import 'package:wallpaper_app/app_configuration/app_colors.dart';
import 'package:wallpaper_app/app_configuration/app_texts.dart';
import 'package:wallpaper_app/app_features/app_terms/app_policy.dart';
import 'package:wallpaper_app/app_features/app_terms/pdf.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    // For changing the default device bottom navigation color
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.background,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(
            AppTexts.terms,
            style: TextStyle(fontSize: 20, color: AppColors.text),
          ),
          backgroundColor: AppColors.background,
          iconTheme: const IconThemeData(
            color: AppColors.text,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Terms of Use link with navigation
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PDFViewerScreen(),
                    ),
                  );
                },
                child: Text(
                  AppTexts.termsofuse,
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.text,
                  ),
                )
              ),
              const SizedBox(height: 16),
              // Privacy Policy link with navigation
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PolicyViewerScreen(),
                      ),
                    );
                },
                child: Text(
                  AppTexts.privacypolicy,
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.text,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
