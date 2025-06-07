import 'package:flutter/material.dart';
// import 'package:wallpaper/app_configuration/app_colors.dart';
// import 'package:wallpaper/app_configuration/app_texts.dart';
import 'package:wallpaper_app/app_configuration/app_colors.dart';
import 'package:wallpaper_app/app_configuration/app_texts.dart';

class MessageDialog extends StatelessWidget {
  const MessageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.dropdown,
      shape: RoundedRectangleBorder(
      ),
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppTexts.message,
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Close the dialog
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppTexts.cancel,
                    style: TextStyle(
                      color: AppColors.change,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                GestureDetector(
                  onTap: () {

                    print("Login with Google tapped");
                  },
                  child: Text(
                    AppTexts.log,
                    style: TextStyle(
                      color: AppColors.change,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
