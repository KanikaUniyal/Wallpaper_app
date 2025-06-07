import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:walllpaper_app/app_configuration/app_colors.dart';
// import 'package:walllpaper_app/app_configuration/app_images.dart';
// import 'package:walllpaper_app/app_home/home_screen.dart';
import 'package:wallpaper_app/app_configuration/app_colors.dart';
import 'package:wallpaper_app/app_configuration/app_images.dart';
import 'package:wallpaper_app/app_home/home_screen.dart';
// import 'package:wallpaper/app_configuration/app_colors.dart';
// import 'package:wallpaper/app_configuration/app_images.dart';
// import 'app_home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.transparent,
      splashIconSize: double.infinity,
      splash: Stack(
        children: [
          // Image.asset(
          //   "images/background_image.jpg",
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.splash,
                  width: 500,
                  height: 300,
                ),
                // const SizedBox(height: 2), // Add some space between the image and text
                const Text(
                  "Wallpaper",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text, // Adjust color as needed
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      nextScreen: HomeScreen(),
    );
  }
}