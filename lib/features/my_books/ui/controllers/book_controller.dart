import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/book_upload_model.dart';
import '../../data/services/book_service.dart';

class BookController extends ChangeNotifier {
  final BookService _bookService;
  BookController({required BookService bookService,}) : _bookService = bookService;

  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;


  Future<bool> uploadBook(BookUploadModel book, {required List<XFile> photos}) async {
    if (_isLoading) return false;

    if (book.action.isPublicListing && photos.isEmpty) {
      _error = "Please add at least one book photo.";
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    String? createdUserBookId;

    try {
      createdUserBookId = await _bookService.createBook(book);

      if (photos.isNotEmpty) {
        await _bookService.uploadBookPhotos(
          userBookId: createdUserBookId,
          photos: photos,
        );
      }

      debugPrint("✅ Book uploaded successfully");
      return true;

    } catch (error) {
    if (createdUserBookId != null) {
    _error = "Book saved, but photo upload failed.";

    } else {
    _error = "Unable to upload book. Please try again.";
    }

    debugPrint("🔴 Book upload error: $error");
    return false;

    } finally {
    _isLoading = false;
    notifyListeners();
    }
  }

}
