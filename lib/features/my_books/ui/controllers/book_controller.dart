import 'package:flutter/foundation.dart';

import '../../data/models/book_upload_model.dart';
import '../../data/services/book_service.dart';

class BookController extends ChangeNotifier {
  final BookService _bookService;
  BookController({required BookService bookService,}) : _bookService = bookService;

  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<bool> uploadBook(BookUploadModel book) async {
    if (_isLoading) return false;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _bookService.createBook(book);

      debugPrint("✅ Book uploaded successfully");
      return true;

    } catch (e) {
    _error = "Unable to upload book. Please try again.";
    debugPrint("🔴 Book upload error: $e");
    return false;

    } finally {
    _isLoading = false;
    notifyListeners();
    }
  }
}
