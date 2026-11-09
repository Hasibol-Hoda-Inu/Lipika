import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/book_upload_model.dart';

class BookService {
  final SupabaseClient _supabase;

  const BookService({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  Future<String> createBook(BookUploadModel book) async {
    final Object? response = await _supabase.rpc(
      'create_book_upload',
      params: <String, dynamic>{
        'p_payload': <String, dynamic>{
          'title': book.title.trim(),
          'author': book.author.trim(),
          'category_id': book.categoryId,
          'publisher': book.publisher,
          'edition': book.edition,
          'description': book.description,
          'price': book.price,
          'condition': book.condition,
          'action': book.action.name,
        },
      },
    );

    return response as String;
  }

  Future<void> uploadBookPhotos({required String userBookId, required List<XFile> photos}) async {
    if (photos.isEmpty) return;

    final String? authUserId = _supabase.auth.currentUser?.id;

    if (authUserId == null) {
      throw StateError("User is not authenticated.");
    }

    final List<String> uploadedPaths = <String>[];
    final List<Map<String, dynamic>> photoRecords = <Map<String, dynamic>>[];

    try {
      for (int index = 0; index < photos.length; index++) {
        final XFile photo = photos[index];

        final int fileSize = await photo.length();

        if (fileSize == 0 || fileSize > 5 * 1024 * 1024) {
          throw Exception("Image must be between 1 byte and 5 MB.");
        }

        final String extension = photo.name.split('.').last.toLowerCase();

        final String contentType = switch (extension) {
          'jpg' || 'jpeg' => 'image/jpeg',
          'png' => 'image/png',
          'webp' => 'image/webp',
          _ => throw Exception("Unsupported image format."),
        };

        final String fileName = '${DateTime.now().microsecondsSinceEpoch}_$index.$extension';
        final String storagePath = '$authUserId/$userBookId/$fileName';
        final Uint8List bytes = await photo.readAsBytes();

        await _supabase.storage.from('book-photos').uploadBinary(
          storagePath,
          bytes,
          fileOptions: FileOptions(
            contentType: contentType,
            upsert: false,
          ),
        );

        uploadedPaths.add(storagePath);

        photoRecords.add(<String, dynamic>{
          'user_book_id': userBookId,
          'storage_path': storagePath,
          'sort_order': index,
        });
      }

      await _supabase
          .from('user_book_photos')
          .insert(photoRecords);

    } catch (error) {
      if (uploadedPaths.isNotEmpty) {
        try {
          await _supabase.storage
              .from('book-photos')
              .remove(uploadedPaths);
        } catch (cleanupError) {
          // Keep the original upload exception.
        }
      }

      rethrow;
    }
  }

}
