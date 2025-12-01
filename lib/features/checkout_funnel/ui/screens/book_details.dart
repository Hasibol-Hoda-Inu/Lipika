import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/routes/app_route_const.dart';
import 'cart.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                IconButton.filledTonal(
                    onPressed: (){},
                    icon: const Icon(Icons.favorite_outline)
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text("Add to Cart"),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
  void onTapCartScreen(){
    GoRouter.of(context).pushNamed(AppRouteConst.cartRouteName);
  }
}
