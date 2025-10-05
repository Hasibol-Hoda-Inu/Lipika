import 'package:flutter/material.dart';
import 'package:lipika/features/home/ui/widgets/book_container.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category Name"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 42,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.56,
                ),
                itemBuilder: (context, index)=> BookContainer(),
                itemCount: 12,
                padding: EdgeInsets.symmetric(horizontal: 20),
            ),
          )
        ],
      ),
    );
  }
}
