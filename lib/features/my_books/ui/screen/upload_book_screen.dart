import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../application/app_colors.dart';
import '../../../category/data/models/category_model.dart';
import '../../../category/ui/controllers/category_controller.dart';
import '../../../common/ui/widgets/app_snackbar.dart';
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
              const SizedBox(height: 20,),
              ChooseOptions(
                selectedAction: _selectedAction,
                onChanged: (BookUploadAction action) {
                  setState(() {
                    _selectedAction = action;
                  });
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _uplaodBook,
                  child: const Text("Continue"),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }


  Form buildUploadBookForm() {
    final bool isPublicListing =
        _selectedAction != BookUploadAction.library;

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

  void _uplaodBook(){
    final bool isValid =
        _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    debugPrint("Selected Category ID: $_selectedCategoryId");
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


