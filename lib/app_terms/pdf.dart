import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:wallpaper/app_configuration/app_colors.dart';
// import 'package:wallpaper/app_configuration/app_images.dart';
import 'package:wallpaper_app/app_configuration/app_colors.dart';
import 'package:wallpaper_app/app_configuration/app_images.dart';

class PDFViewerScreen extends StatelessWidget {
  const PDFViewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Use',style: TextStyle(fontSize: 20, color: AppColors.text),
        ),
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: AppColors.text),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SfPdfViewer.asset(
        AppImages.user_agreement,
      ),
    );
  }
}
