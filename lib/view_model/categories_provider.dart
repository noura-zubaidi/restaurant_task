import 'package:flutter/material.dart';
import 'package:resturant_task/model/categories.dart';
import 'package:resturant_task/repo/categories_services.dart';

class CategoriesProvider with ChangeNotifier {
  TheCategories? _theCategories;
  bool _isLoading = false;

  TheCategories? get theCategories => _theCategories;
  bool get isLoading => _isLoading;
  final CategoriesServices _categoriesServices;
  CategoriesProvider(this._categoriesServices);
  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();
    try {
      _theCategories = await _categoriesServices.getCategories();
      _theCategories?.categories?.forEach((category) {});
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
