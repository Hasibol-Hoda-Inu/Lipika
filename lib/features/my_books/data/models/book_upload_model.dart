import 'book_upload_action.dart';

class BookUploadModel {
  final String title;
  final String author;
  final String categoryId;

  final String? publisher;
  final String? edition;
  final String? description;

  final double? price;
  final String? condition;

  final BookUploadAction action;

  const BookUploadModel({
    required this.title,
    required this.author,
    required this.categoryId,
    required this.action,
    this.publisher,
    this.edition,
    this.description,
    this.price,
    this.condition,
  });
}
