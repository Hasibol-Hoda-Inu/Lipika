import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lipika/application/assets_path.dart';
import 'package:lipika/features/common/ui/widgets/book_search_anchor.dart';
import 'package:lipika/features/home/ui/widgets/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../../../../application/app_colors.dart';
import '../../../../application/routes/app_route_const.dart';
import '../../../category/data/models/category_model.dart';
import '../../../category/ui/controllers/category_controller.dart';
import '../../../category/ui/screens/categories_screen.dart';
import '../../../common/ui/widgets/app_snackbar.dart';
import '../widgets/book_container.dart';
import '../widgets/category_container.dart';
import '../widgets/category_shimmer.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _loadCategories();
    });
  }

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
            onPressed: _onTapCart,
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
              child: Consumer<CategoryController>(
                builder: (
                    BuildContext context,
                    CategoryController controller,
                    Widget? child,
                    ) {
                  if (controller.isLoading) {
                    return const CategoryShimmer();
                  }

                  if (controller.error != null && controller.categories.isEmpty) {
                    return Center(child: Text(controller.error!),);
                  }

                  final List<CategoryModel> categories = controller.categories;

                  if (categories.isEmpty) {
                    return const Center(child: Text("No categories available"),);
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final CategoryModel category = categories[index];

                      return CategoryContainer(
                        category: category,
                        onTapCategoryScreen: _onTapCategoryScreen,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 12);
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
            SectionTitle(title: "Purchasable Books", onTap: _onTapCategoryScreen,),
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
            SectionTitle(title: "Books to Swap", onTap: _onTapCategoryScreen,),
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
            SectionTitle(title: "Books for Borrow", onTap: _onTapCategoryScreen,),
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

  Future<void> _loadCategories() async {
    final CategoryController controller = context.read<CategoryController>();

    final bool isSuccess = await controller.loadCategories();

    if (!mounted) return;

    if (!isSuccess && controller.error != null) {
      AppSnackBar.show(
        context,
        message: controller.error!,
        type: SnackBarType.error,
      );
    }
  }

  void _onTapCategoryScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CategoriesScreen()),
    );
  }

  void _onTapCart(){
    GoRouter.of(context).pushNamed(AppRouteConst.cartRouteName);
  }
}
