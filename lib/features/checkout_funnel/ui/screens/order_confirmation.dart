import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lipika/application/app_colors.dart';

import '../../../../application/routes/app_route_const.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({super.key});

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 98, color: AppColors.themeColor,),
            const SizedBox(height: 28,),
            Text("Your order has been placed!", style: Theme.of(context).textTheme.titleLarge,),
            const Text("Track your all orders from the order list. Thank you!"),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text("Continue Shopping")),
            )
          ],
        ),
      ),
    );
  }
  void onPressed(){
    GoRouter.of(context).pushNamed(AppRouteConst.homeRouteName);
  }
}
