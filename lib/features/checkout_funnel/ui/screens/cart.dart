import 'package:flutter/material.dart';
import 'package:lipika/features/checkout_funnel/ui/widgets/dotted_divider.dart';

import '../widgets/cart_item_card.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const CartItemCard(),

            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                spacing: 12,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotals for products",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black87
                        ),
                      ),
                      Text("\$ 100",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black87
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Discount vouchers",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black87
                        ),
                      ),
                      Text("\$ 0",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black87
                        ),
                      ),
                    ],
                  ),
                  const DottedDivider(
                    dotWidth: 8,
                    spacing: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                        ),

                      ),
                      Text("\$ 100",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black87,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){},
                    child: const Text("Checkout"),
                )),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}


