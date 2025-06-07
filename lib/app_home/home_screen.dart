import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app_configuration/app_colors.dart';
import 'package:wallpaper_app/app_configuration/app_texts.dart';
import 'package:wallpaper_app/app_features/app_drawer.dart';
import 'package:wallpaper_app/app_features/app_messagebox.dart';
import 'package:wallpaper_app/app_home/home_screen_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "Popular"; // Default selected category
  List<String> selectedImageUrls = []; // To store selected image URLs
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeScreenProvider>();
    if (provider.images.isEmpty) {
      provider.fetchImages();
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.background,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text(
            AppTexts.wallpaperTitle,
            style: TextStyle(fontSize: 18, color: AppColors.text),
          ),
          backgroundColor: AppColors.background,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: const Icon(Icons.menu, color: AppColors.text),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                print("Search icon pressed");
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {
                print("User icon pressed");
              },
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCategoryButton(context, "Popular"),
                    const SizedBox(width: 50),
                    _buildCategoryButton(context, "Recent"),
                    const SizedBox(width: 50),
                    _buildCategoryButton(context, "Trending"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            provider.images.isNotEmpty
                ? Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: provider.images.length,
                itemBuilder: (context, index) {
                  final imageUrl = provider.images[index];
                  final isSelected = selectedImageUrls.contains(imageUrl);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedImageUrls.remove(imageUrl);
                        } else {
                          selectedImageUrls.add(imageUrl);
                        }
                      });
                      print("Selected images: $selectedImageUrls");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: isSelected
                            ? Border.all(color: Colors.yellow, width: 3)
                            : null,
                      ),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            )
                : const Center(child: CircularProgressIndicator()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectedImageUrls.isNotEmpty) {
              _showMessageDialog(context, selectedImageUrls);
            } else {
              print("No images selected");
            }
          },
          backgroundColor: AppColors.change,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String text) {
    final isSelected = selectedCategory == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
        print("$text button clicked");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.yellow, width: 1),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : AppColors.text,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  void _showMessageDialog(BuildContext context, List<String> imageUrls) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) =>
          AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Selected Images"),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: imageUrls
                        .map((url) =>
                        Image.network(url, height: 100, fit: BoxFit.cover))
                        .toList(),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Close"),
              ),
            ],
          ),
    );
  }
}
