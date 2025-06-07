import 'package:flutter/material.dart';
// import 'package:wallpaper/app_configuration/app_colors.dart';
// import 'package:wallpaper/app_configuration/app_images.dart';
// import 'package:wallpaper/app_configuration/app_texts.dart';
// import 'package:wallpaper/app_features/3D/3dscreen_view.dart';
// import 'package:wallpaper/app_features/Abstract/Abstract_screen.dart';
// import 'package:wallpaper/app_features/app_messagebox.dart';
// import 'package:wallpaper/app_features/app_settings/setting_screen.dart';
// import 'package:wallpaper/app_features/app_terms&privacy.dart';
// import 'package:wallpaper/app_features/app_terms/app_terms&privacy.dart';
// import 'package:wallpaper/app_features/app_wallpaper_changer/wallpaper_changer_screen.dart';
// import 'package:wallpaper/app_home/home_screen.dart';
import 'package:wallpaper_app/app_configuration/app_colors.dart';
import 'package:wallpaper_app/app_configuration/app_images.dart';
import 'package:wallpaper_app/app_configuration/app_texts.dart';
import 'package:wallpaper_app/app_features/3D/3dscreen_view.dart';
import 'package:wallpaper_app/app_features/Abstract/Abstract_screen.dart';
import 'package:wallpaper_app/app_features/app_messagebox.dart';
import 'package:wallpaper_app/app_features/app_settings/setting_screen.dart';
import 'package:wallpaper_app/app_features/app_terms/app_terms&privacy.dart';
import 'package:wallpaper_app/app_features/app_wallpaper_changer/wallpaper_changer_screen.dart';
import 'package:wallpaper_app/app_home/home_screen.dart';
// import 'package:wallpaper/home_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String _selectedItem = ''; // Track the selected item

  void _onItemTap(String item, BuildContext context, Widget targetScreen) {
    setState(() {
      _selectedItem = item;
    });
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => targetScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 200, // Adjust the height of the header
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.menu),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: const Text(
                AppTexts.wallpaperTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              AppTexts.log,
              style: TextStyle(color: _selectedItem == 'Login with Google' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Login with Google', context, LoginScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.home, color: AppColors.icon),
            title: Text(
              AppTexts.home2,
              style: TextStyle(color: _selectedItem == 'Home' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
               _onItemTap('Home', context, HomeScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.image, color: AppColors.icon),
            title: Text(
              AppTexts.wallpaperchange,
              style: TextStyle(color: _selectedItem == 'Wallpaper Change' ? AppColors.change: AppColors.text),
            ),
            onTap: () {
               _onItemTap('Wallpaper Change', context, WallpaperChangerScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.star, color: AppColors.icon),
            title: Text(
              AppTexts.favourites,
              style: TextStyle(
                color: _selectedItem == 'Favourites' ? AppColors.change : AppColors.text,
              ),
            ),
            onTap: () {
              setState(() {
                _selectedItem = 'Favourites';
              });
              showDialog(
                context: context,
                builder: (BuildContext context) => MessageDialog(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.history, color: AppColors.icon),
            title: Text(
              AppTexts.history,
              style: TextStyle(
                color: _selectedItem == 'History' ? AppColors.change : AppColors.text,
              ),
            ),
            onTap: () {
              setState(() {
                _selectedItem = 'History';
              });
              showDialog(
                context: context,
                builder: (BuildContext context) => MessageDialog(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.subscriptions, color: AppColors.icon),
            title: Text(
              AppTexts.subscription,
              style: TextStyle(color: _selectedItem == 'Subscription' ? AppColors.change: AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Subscription', context, SubscriptionScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: AppColors.icon),
            title: Text(
              AppTexts.setting,
              style: TextStyle(color: _selectedItem == 'Settings' ? AppColors.change: AppColors.text),
            ),
            onTap: () {
               _onItemTap('Settings', context, SettingScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.support, color: AppColors.icon),
            title: Text(
              AppTexts.support,
              style: TextStyle(color: _selectedItem == 'Support' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Support', context, SupportScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.tiktok, color: AppColors.icon),
            title: Text(
              AppTexts.tiktok,
              style: TextStyle(color: _selectedItem == 'Our TikTok' ? AppColors.change: AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Our TikTok', context, TikTokScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined, color: AppColors.icon),
            title: Text(
              AppTexts.terms,
              style: TextStyle(color: _selectedItem == 'Privacy Policy' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
               _onItemTap('Privacy Policy', context, TermsAndPrivacy());
            },
          ),
          Divider(
            color: AppColors.icon,
            thickness: 0,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            title: Text(
              AppTexts.all,
              style: TextStyle(color: _selectedItem == 'All Categories' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
               _onItemTap('Privacy Policy', context, HomeScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.d,
              style: TextStyle(color: _selectedItem == '3D' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
               _onItemTap('Privacy Policy', context, ScreenView());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.abstract,
              style: TextStyle(color: _selectedItem == 'Abstract' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
               _onItemTap('Privacy Policy', context, AbstractScreenView());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.animal,
              style: TextStyle(color: _selectedItem == 'Animals' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.anime,
              style: TextStyle(color: _selectedItem == 'Anime' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.art,
              style: TextStyle(color: _selectedItem == 'Art' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.black,
              style: TextStyle(color: _selectedItem == 'Black' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.white,
              style: TextStyle(color: _selectedItem == 'Black and white' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.car,
              style: TextStyle(color: _selectedItem == 'Cars' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.city,
              style: TextStyle(color: _selectedItem == 'City' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.dark,
              style: TextStyle(color: _selectedItem == 'Dark' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.fantasy,
              style: TextStyle(color: _selectedItem == 'Fantasy' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.flower,
              style: TextStyle(color: _selectedItem == 'Flowers' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.food,
              style: TextStyle(color: _selectedItem == 'Food' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.girl,
              style: TextStyle(color: _selectedItem == 'Girls' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.holiday,
              style: TextStyle(color: _selectedItem == 'Holidays' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.love,
              style: TextStyle(color: _selectedItem == 'Love' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.macro,
              style: TextStyle(color: _selectedItem == 'Macro' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.men,
              style: TextStyle(color: _selectedItem == 'Men' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.minimalism,
              style: TextStyle(color: _selectedItem == 'Minimalism' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.motorcycle,
              style: TextStyle(color: _selectedItem == 'Motorcycle' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.music,
              style: TextStyle(color: _selectedItem == 'Music' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.nature,
              style: TextStyle(color: _selectedItem == 'Nature' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.other,
              style: TextStyle(color: _selectedItem == 'Other' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.space,
              style: TextStyle(color: _selectedItem == 'Space' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.sport,
              style: TextStyle(color: _selectedItem == 'Sport' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.technologies,
              style: TextStyle(color: _selectedItem == 'Technologies' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.textures,
              style: TextStyle(color: _selectedItem == 'Textures' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.vector,
              style: TextStyle(color: _selectedItem == 'Vector' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.words,
              style: TextStyle(color: _selectedItem == 'Words' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
          ListTile(
            title: Text(
              AppTexts.halloween,
              style: TextStyle(color: _selectedItem == 'Halloween' ? AppColors.change : AppColors.text),
            ),
            onTap: () {
              // _onItemTap('Privacy Policy', context, PrivacyPolicyScreen());
            },
          ),
        ],
      ),

    );
  }
}
