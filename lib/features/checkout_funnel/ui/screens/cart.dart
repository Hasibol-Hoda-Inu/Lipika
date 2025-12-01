import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/routes/app_route_const.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/order_summery_card.dart';

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
            const OrderSummaryCard(),
            const SizedBox(height: 20,),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onTapCheckoutScreen,
                    child: const Text("Checkout"),
                )),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
  void onTapCheckoutScreen(){
    GoRouter.of(context).pushNamed(AppRouteConst.checkoutRouteName);
  }
}




