import 'package:flutter/material.dart';

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
          controller: controller,
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
          hintText: 'Search any books',
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