import 'package:flutter/material.dart';
import 'package:lipika/application/app_colors.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({super.key});

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 48, color: AppColors.themeColor,),
            Text("Your order has been placed!", style: Theme.of(context).textTheme.titleLarge,),
            Text("Track your all orders from the order list. Thank you!"),
            Container(),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){},
                  child: const Text("Continue Shopping")),
            )
          ],
        ),
      ),
    );
  }
}
