import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomeScreenProvider extends ChangeNotifier {
  String _selectedCategory = 'Popular';
  List<String> _images = [];

  String get selectedCategory => _selectedCategory;
  List<String> get images => _images;


  void updateCategory(String newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
    fetchImages();
  }


  Future<void> fetchImages() async {
    final response = await http.get(Uri.parse('https://picsum.photos/v2/list?page=1&limit=20'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      _images = jsonResponse.map<String>((item) => item['download_url']).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
