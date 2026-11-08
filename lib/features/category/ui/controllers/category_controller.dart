
import 'package:flutter/foundation.dart';

import '../../data/models/category_model.dart';
import '../../data/services/category_service.dart';

class CategoryController extends ChangeNotifier {
  final CategoryService _categoryService;

  CategoryController({required CategoryService categoryService}) : _categoryService = categoryService;

  List<CategoryModel> _categories = <CategoryModel>[];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  bool _hasLoaded = false;
  bool get hasLoaded => _hasLoaded;

  List<CategoryModel> get categories => List<CategoryModel>.unmodifiable(_categories);


  Future<bool> loadCategories({bool forceRefresh = false}) async {

    if (_isLoading) return false;
    if (_hasLoaded && !forceRefresh) {
      return true;
    }
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final List<Map<String, dynamic>> data = await _categoryService.getActiveCategories();

      _categories = data.map((Map<String, dynamic> item) => CategoryModel.fromJson(item),).toList();
      _hasLoaded = true;
      debugPrint("✅ Loaded ${_categories.length} categories");
      return true;

    } catch (e) {
    _error = "Unable to load categories. Please try again.";
    debugPrint("❎ Category loading error: $e");
    return false;

    } finally {
    _isLoading = false;
    notifyListeners();
    }
  }

}
