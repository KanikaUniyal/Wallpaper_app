import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app_configuration/app_colors.dart';
import 'package:wallpaper_app/app_configuration/app_texts.dart';
import 'package:wallpaper_app/app_features/3D/3dscreen_provider.dart';
import 'package:wallpaper_app/app_features/app_drawer.dart';


class AbstractScreenView extends StatelessWidget {
  const AbstractScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelectedTabProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppTexts.abstract.toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.text,
            ),
          ),
          backgroundColor: AppColors.background,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: AppColors.text),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: AppColors.text),
              onPressed: () {
                // Handle the functionality
              },
            ),
          ],
        ),
        drawer:  AppDrawer(),
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildTextWithUnderline(context, 'NEW'),
              _buildTextWithUnderline(context, 'POPULAR'),
              _buildTextWithUnderline(context, 'RANDOM'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextWithUnderline(BuildContext context, String label) {
    return Consumer<SelectedTabProvider>(
      builder: (context, selectedTabProvider, _) {
        bool isSelected = label == selectedTabProvider.selectedTab;

        return GestureDetector(
          onTap: () {
            selectedTabProvider?.selectTab(label); //  for updating the selected tab
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.text,
                  ),
                ),
                if (isSelected)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 2,
                    width: 90,
                    color: AppColors.change,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
