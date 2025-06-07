import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:wallpaper/app_configuration/app_colors.dart';
// import 'package:wallpaper/app_configuration/app_texts.dart';
// import 'package:wallpaper/app_features/app_settings/setting_screen_provider.dart';
import 'package:wallpaper_app/app_configuration/app_colors.dart';
import 'package:wallpaper_app/app_configuration/app_texts.dart';
import 'package:wallpaper_app/app_features/app_settings/setting_screen_provider.dart';
// import 'settings_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppTexts.setting,
          style: TextStyle(fontSize: 20, color: AppColors.text),
        ),
        backgroundColor: AppColors.background,
        iconTheme: const IconThemeData(
          color: AppColors.text,
        ),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Data Usage
            const Text(
              'Data usage',
              style: TextStyle(fontSize: 16, color: AppColors.icon),
            ),
            const SizedBox(height: 24),
            buildSwitchRow(
              title: 'Download wallpapers only over Wi-Fi.',
              description:
              'Data transferring will be paused when Wi-Fi connection is not available.',
              value: settingsProvider.isDataUsageSwitched,
              onChanged: settingsProvider.toggleDataUsage,
            ),
            const SizedBox(height: 38),

            // Section 2: Setting Wallpaper
            const Text(
              'Setting wallpaper',
              style: TextStyle(fontSize: 16, color: AppColors.icon),
            ),
            const SizedBox(height: 24),
            buildSwitchRow(
              title: 'Wallpapers Installer',
              description: 'Use Wallpaper Installer by default.',
              value: settingsProvider.isWallpaperSettingSwitched,
              onChanged: settingsProvider.toggleWallpaperSetting,
            ),
            const SizedBox(height: 38),

            // Section 3: Notifications
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 16, color: AppColors.icon),
            ),
            const SizedBox(height: 24),
            buildSwitchRow(
              title: 'Push-notifications',
              description: '',
              value: settingsProvider.isPushNotificationsSwitched,
              onChanged: settingsProvider.togglePushNotifications,
            ),
            const SizedBox(height: 38),

            // Section 4: Install ID (Without Toggle Button)
            const Text(
              'Install ID',
              style: TextStyle(fontSize: 16, color: AppColors.icon),
            ),
            const SizedBox(height: 24),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Unique Install ID\n',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                  TextSpan(
                    text:
                    'ID may be required to help developers resolve an error',
                    style: TextStyle(
                      fontSize: 13.5,
                      color: AppColors.text,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwitchRow({
    required String title,
    required String description,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '$title\n',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
                if (description.isNotEmpty)
                  TextSpan(
                    text: description,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.text,
                    ),
                  ),
              ],
            ),
          ),
        ),
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.change,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}
