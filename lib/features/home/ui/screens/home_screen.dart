import 'package:flutter/material.dart';
import 'package:lipika/application/assets_path.dart';
import 'package:lipika/features/common/ui/widgets/book_search_anchor.dart';
import 'package:lipika/features/home/ui/widgets/carousel_slider.dart';

import '../../../../application/app_colors.dart';
import '../../../category/ui/screens/categories_screen.dart';
import '../widgets/book_container.dart';
import '../widgets/category_container.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(AssetsPath.logo),
        ),
        title: const Text("Lipika"),
        centerTitle: true,
        actions: [
          IconButton.filledTonal(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CarouselSliderWidget(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: BookSearchAnchor(),
            ),
            const SizedBox(height: 30),
            SectionTitle(title: 'Explore by categories', onTap: _onTapCategoryScreen,),
            const SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return CategoryContainer(
                    onTapCategoryScreen: _onTapCategoryScreen,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 12);
                },
              ),
            ),
            const SizedBox(height: 30),
            SectionTitle(title: "Books for you", onTap: _onTapCategoryScreen,),
            const SizedBox(height: 12),
            SizedBox(
              height: 290,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const BookContainer();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 12);
                },
              ),
            ),
            const SizedBox(height: 30),
            const Divider(color: AppColors.borderColor, thickness: 8),
            const SizedBox(height: 30),
            SectionTitle(title: "Most popular books", onTap: _onTapCategoryScreen,),
            const SizedBox(height: 12),
            SizedBox(
              height: 290,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const BookContainer();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 12);
                },
              ),
            ),
            const SizedBox(height: 30),
            SectionTitle(title: "New books in library", onTap: _onTapCategoryScreen,),
            const SizedBox(height: 12),
            SizedBox(
              height: 290,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const BookContainer();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 12);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapCategoryScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CategoriesScreen()),
    );
  }
}
