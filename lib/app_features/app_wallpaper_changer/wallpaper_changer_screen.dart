import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:wallpaper/app_configuration/app_colors.dart';
// import 'package:wallpaper/app_features/app_drawer.dart';
// import 'package:wallpaper/app_features/app_wallpaper_changer/wallpaper_message.dart';
import 'package:wallpaper_app/app_configuration/app_colors.dart';
import 'package:wallpaper_app/app_features/app_drawer.dart';
import 'package:wallpaper_app/app_features/app_wallpaper_changer/wallpaper_message.dart';
import 'wallpaper_changer_provider.dart';

class WallpaperChangerScreen extends StatelessWidget {
  const WallpaperChangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wallpaperProvider = Provider.of<WallpaperChangerProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Wallpaper Changer',
          style: TextStyle(fontSize: 20, color: AppColors.text),
        ),
        backgroundColor: AppColors.background,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: AppColors.text),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: AppColors.change,
              size: 25,
            ),
            onPressed: () => _showHelpDialog(context),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequency of changing wallpaper: ${wallpaperProvider.selectedTime}',
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 1.5,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                activeTrackColor: AppColors.change,
                inactiveTrackColor: AppColors.icon,
                thumbColor: AppColors.change,
                overlayColor: AppColors.change.withOpacity(0.2),
              ),
              child: Slider(
                value: wallpaperProvider.selectedIndex.toDouble(),
                min: 0,
                max: (wallpaperProvider.timeIntervals.length - 1).toDouble(),
                divisions: wallpaperProvider.timeIntervals.length - 1,
                onChanged: (value) => wallpaperProvider.updateSelectedIndex(value.toInt()),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Wallpaper change screen: ${wallpaperProvider.selectedScreen}',
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.lock,
                    color: wallpaperProvider.selectedScreenIndex == 0
                        ? AppColors.change
                        : AppColors.icon,
                  ),
                  onPressed: () => wallpaperProvider.updateSelectedScreenIndex(0),
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: wallpaperProvider.selectedScreenIndex == 1
                        ? AppColors.change
                        : AppColors.icon,
                  ),
                  onPressed: () => wallpaperProvider.updateSelectedScreenIndex(1),
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: Icon(
                    Icons.devices_other_outlined,
                    color: wallpaperProvider.selectedScreenIndex == 2
                        ? AppColors.change
                        : AppColors.icon,
                  ),
                  onPressed: () => wallpaperProvider.updateSelectedScreenIndex(2),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.warning_amber, color: AppColors.icon),
                          const Text('Changers setting Applied'),
                          IconButton(
                            icon: const Icon(Icons.close, color: AppColors.icon),
                            onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                          ),
                        ],
                      ),
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.only(top: 20, bottom: 600, left: 16, right: 16),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.text,
                  backgroundColor: AppColors.change,
                  minimumSize: const Size(200, 60),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text('APPLY SETTINGS'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => const WallpaperMessage(),
    );
  }
}
