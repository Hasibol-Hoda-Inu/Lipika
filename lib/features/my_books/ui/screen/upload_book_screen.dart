import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../application/app_colors.dart';
import '../../../category/data/models/category_model.dart';
import '../../../category/ui/controllers/category_controller.dart';
import '../../../common/ui/widgets/app_snackbar.dart';
import '../../data/models/book_upload_action.dart';
import '../../data/models/book_upload_model.dart';
import '../controllers/book_controller.dart';
import '../widgets/choose_options.dart';

class UploadBookScreen extends StatefulWidget {
  const UploadBookScreen({super.key});

  @override
  State<UploadBookScreen> createState() => _UploadBookScreenState();
}

class _UploadBookScreenState extends State<UploadBookScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _publisherController = TextEditingController();
  final TextEditingController _editionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedCondition;
  String? _selectedCategoryId;

  final ImagePicker _imagePicker = ImagePicker();
  final List<XFile> _selectedPhotos = <XFile>[];

  BookUploadAction _selectedAction = BookUploadAction.library;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Book"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12,),
              buildUploadBookForm(),
              buildBookPhotoPicker(),
              const SizedBox(height: 20,),
              ChooseOptions(
                selectedAction: _selectedAction,
                onChanged: (BookUploadAction action) {
                  setState(() {
                    _selectedAction = action;
                  });
                },
              ),
              Consumer<BookController>(
                builder: (context, controller, child) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.isLoading ? null : _uploadBook,
                      child: controller.isLoading
                          ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                          : const Text("Continue"),
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }


  Form buildUploadBookForm() {
    final bool isPublicListing = _selectedAction != BookUploadAction.library;
    return Form(
      key: _formKey,
      child: Column(
        spacing: 12,
        children: [
          TextFormField(
            controller: _titleController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: "Book Name",
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Please enter the book name";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _authorController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: "Author Name",
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Please enter the author name";
              }
              return null;
            },
          ),
          Consumer<CategoryController>(
            builder: (context, controller, child) {
              final List<CategoryModel> categories = controller.categories;

              if (!controller.hasLoaded && categories.isEmpty) {
                return const LinearProgressIndicator();
              }

              if (controller.error != null && categories.isEmpty) {
                return const Text("Unable to load categories.",);
              }

              return DropdownButtonFormField<String>(
                initialValue: _selectedCategoryId,
                isExpanded: true,
                borderRadius: BorderRadius.circular(12),
                menuMaxHeight: 420,
                decoration: const InputDecoration(
                  labelText: "Book Category",
                  hintText: "Select a category",
                ),
                items: categories.map<DropdownMenuItem<String>>(
                      (CategoryModel category) {
                    return DropdownMenuItem<String>(
                      value: category.id,
                      child: Text(
                        category.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ).toList(),
                onChanged: categories.isEmpty ? null : (String? value) {
                  _selectedCategoryId = value;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please select a category";
                  }
                  return null;
                },
              );
            },
          ),

          TextFormField(
            controller: _publisherController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: "Publisher Name (Optional)",
            ),
          ),
          TextFormField(
            controller: _editionController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: "Edition (Optional)",
            ),
          ),
          if (_selectedAction == BookUploadAction.sell)
            TextFormField(
              controller: _priceController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Selling Price (৳)",
              ),
              validator: (value) {
                final price = double.tryParse(
                  value?.trim() ?? '',
                );

                if (price == null || price <= 0) {
                  return "Please enter a valid price";
                }
                return null;
              },
            ),
          if (isPublicListing)
            DropdownButtonFormField<String>(
              initialValue: _selectedCondition,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: "Book Condition",
                hintText: "Select a condition",
              ),
              items: const [
                DropdownMenuItem(
                  value: "new",
                  child: Text("New"),
                ),
                DropdownMenuItem(
                  value: "like_new",
                  child: Text("Like New"),
                ),
                DropdownMenuItem(
                  value: "good",
                  child: Text("Good"),
                ),
                DropdownMenuItem(
                  value: "fair",
                  child: Text("Fair"),
                ),
                DropdownMenuItem(
                  value: "poor",
                  child: Text("Poor"),
                ),
              ],
              onChanged: (value) {
                _selectedCondition = value;
              },
              validator: (value) {
                if (value == null) {
                  return "Please select the book condition";
                }
                return null;
              },
            ),
          TextFormField(
            controller: _descriptionController,
            maxLines: 3,
            textInputAction: TextInputAction.done,
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              labelText: "Description (Optional)",
              alignLabelWithHint: true,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _uploadBook() async {
    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;
    await _submitBook();

  }

  Future<void> _submitBook() async {
    final BookController controller = context.read<BookController>();

    final BookUploadModel book = BookUploadModel(
      title: _titleController.text.trim(),
      author: _authorController.text.trim(),
      categoryId: _selectedCategoryId!,
      publisher: _publisherController.text.trim(),
      edition: _editionController.text.trim(),
      description: _descriptionController.text.trim(),
      action: _selectedAction,
      condition: _selectedAction.isPublicListing
          ? _selectedCondition
          : null,
      price: _selectedAction.requiresPrice
          ? double.tryParse(_priceController.text.trim())
          : null,
    );

    final bool isSuccess = await controller.uploadBook(book, photos: _selectedPhotos);

    if (!mounted) return;

    if (isSuccess) {
      _resetUploadForm();
      AppSnackBar.show(
        context,
        message: "Book saved successfully!",
        type: SnackBarType.success,
      );
    } else {
      AppSnackBar.show(
        context,
        message: controller.error ?? "Unable to save book.",
        type: SnackBarType.error,
      );
    }
  }

  Widget buildBookPhotoPicker() {
    return Column(
      crossAxisAlignment: .start,
      spacing: 12,
      children: [
        Text(
          "Book Photos",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          "Add a photo of your book. More photos are optional.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            OutlinedButton(
              onPressed: _pickBookPhotos,
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(108, 108),
                padding: EdgeInsets.zero,
                side: const BorderSide(
                  color: AppColors.borderColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Icon(Icons.add_a_photo_outlined, size: 28),
                  Text("Add Photo"),
                ],
              ),
            ),

            for (final (int index, XFile photo)
            in _selectedPhotos.indexed)
              SizedBox(
                width: 108,
                height: 108,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(photo.path),
                        width: 108,
                        height: 108,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      top: -6,
                      right: -6,
                      child: IconButton.filledTonal(
                        constraints: const BoxConstraints.tightFor(
                          width: 28,
                          height: 28,
                        ),
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.close, size: 16),
                        onPressed: () {
                          setState(() {
                            _selectedPhotos.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }

  Future<void> _pickBookPhotos() async {
    final ImageSource? source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (sheetContext) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text("Take a photo"),
                onTap: () => Navigator.pop(
                  sheetContext,
                  ImageSource.camera,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text("Choose from gallery"),
                onTap: () => Navigator.pop(
                  sheetContext,
                  ImageSource.gallery,
                ),
              ),
            ],
          ),
        );
      },
    );

    if (!mounted || source == null) return;

    try {
      List<XFile> photos = <XFile>[];

      if (source == ImageSource.camera) {
        final XFile? photo = await _imagePicker.pickImage(
          source: ImageSource.camera,
          imageQuality: 85,
        );

        if (photo != null) {
          photos = <XFile>[photo];
        }
      } else {
        photos = await _imagePicker.pickMultiImage(imageQuality: 85);
      }

      if (!mounted || photos.isEmpty) return;
      final List<XFile> validPhotos = <XFile>[];

      for (final XFile photo in photos) {
        final int size = await photo.length();

        if (size <= 5 * 1024 * 1024) {
          validPhotos.add(photo);
        }
      }

      if (!mounted) return;

      setState(() {
        for (final XFile photo in validPhotos) {
          if (!_selectedPhotos.any(
                  (XFile existing) => existing.path == photo.path)
          ) {
            _selectedPhotos.add(photo);
          }
        }
      });

      if (validPhotos.length != photos.length) {
        AppSnackBar.show(
          context,
          message: "Some images exceed the 5 MB limit.",
          type: SnackBarType.error,
        );
      }

    } catch (error) {
    if (!mounted) return;
    AppSnackBar.show(
    context,
    message: "Unable to select photos. Please try again.",
    type: SnackBarType.error,
    );
    debugPrint("🔴 Image picker error: $error");
    }
  }

  void _resetUploadForm() {
    _formKey.currentState?.reset();

    _titleController.clear();
    _authorController.clear();
    _publisherController.clear();
    _editionController.clear();
    _priceController.clear();
    _descriptionController.clear();

    _selectedCategoryId = null;
    _selectedCondition = null;

    setState(() {
      _selectedAction = BookUploadAction.library;
      _selectedPhotos.clear();
    });

    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _publisherController.dispose();
    _editionController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}


