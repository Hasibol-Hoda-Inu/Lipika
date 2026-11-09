
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
}
