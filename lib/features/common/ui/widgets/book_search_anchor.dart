import 'package:flutter/material.dart';
import '../../../../application/app_colors.dart';

class BookSearchAnchor extends StatefulWidget {
  const BookSearchAnchor({super.key});

  @override
  State<BookSearchAnchor> createState() => _BookSearchAnchorState();
}

class _BookSearchAnchorState extends State<BookSearchAnchor> {
  final List<String> _recentSearches = [
    'The Shadow of the Wind',
    'Atomic Habits',
    'Project Hail Mary',
    'remote job flutter dev',
    'ui flutter',
  ];

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, SearchController controller) {
        return SearchBar(
          // ... (your existing SearchBar code is fine)
          controller: controller,
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 16.0),
          ),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
          hintText: 'Search any books',
          elevation: WidgetStateProperty.all<double>(0.0),
          backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: AppColors.borderColor),
            ),
          ),
        );
      },
      suggestionsBuilder: (context, SearchController controller) {
        return List<Widget>.generate(_recentSearches.length, (int index) {
          final String item = _recentSearches[index];
          return ListTile(
            leading: const Icon(Icons.history),
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
                // TODO: onTap navigate to the search results page with the query 'item'
              });
            },
          );
        });
      },
    );
  }
}