import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app_features/3D/3dscreen_provider.dart';
import 'package:wallpaper_app/app_features/app_settings/setting_screen_provider.dart';
import 'package:wallpaper_app/app_features/app_wallpaper_changer/wallpaper_changer_provider.dart';
import 'package:wallpaper_app/app_home/home_screen_provider.dart';
// import 'package:walllpaper_app/app_features/3D/3dscreen_provider.dart';
// import 'package:walllpaper_app/app_features/app_settings/setting_screen_provider.dart';
// import 'package:walllpaper_app/app_features/app_wallpaper_changer/wallpaper_changer_provider.dart';
// import 'package:walllpaper_app/app_home/home_screen_provider.dart';
// import 'package:wallpaper/app_features/3D/3dscreen_provider.dart';
// import 'package:wallpaper/app_features/app_settings/setting_screen_provider.dart';
// import 'package:wallpaper/app_features/app_wallpaper_changer/wallpaper_changer_provider.dart';
// import 'package:wallpaper/app_features/app_wallpaper_changer/wallpaper_changer_provider.dart';
// import 'package:wallpaper/app_home/home_screen_provider.dart';
import 'splash_screen.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (_) => WallpaperChangerProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_)=>SelectedTabProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: SplashScreen(), // Set SplashScreen as the initial screen
    );
  }
}
