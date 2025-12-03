import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lipika/features/checkout_funnel/ui/widgets/book_view_slider.dart';

import '../../../../application/app_colors.dart';
import '../../../../application/routes/app_route_const.dart';
import '../widgets/book_info_section.dart';
import '../widgets/review_card.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Details"),
        centerTitle: true,
        actions: [
          IconButton.filledTonal(
              onPressed: onTapCartScreen,
              icon: const Icon(Icons.shopping_cart_outlined)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BookViewSlider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                spacing: 12,
                children: [
                  const BookInfoSection(),
                  buildReviewSection(context),
                  Row(
                    children: [
                      IconButton.filledTonal(
                          onPressed: (){},
                          icon: const Icon(Icons.favorite_outline)
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onTapCartScreen,
                          child: const Text("Add to Cart"),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildReviewSection(BuildContext context) {
    return Column(
              spacing: 12,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Review", style: Theme.of(context).textTheme.titleLarge,),
                    const Text("Total 61 reviews"),
                  ],
                ),
                const ReviewCard(),
                const Divider(thickness: 1, color: AppColors.borderColor,),
                const ReviewCard(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        side: const BorderSide(
                            color: AppColors.borderColor
                        ),
                        foregroundColor: AppColors.themeColor,
                      ),
                      child: const Text("View all reviews",)),
                ),
              ],
            );
  }

  void onTapCartScreen(){
    GoRouter.of(context).pushNamed(AppRouteConst.cartRouteName);
  }
}




