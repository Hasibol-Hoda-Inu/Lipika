import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lipika/application/app_colors.dart';
import 'package:lipika/features/checkout_funnel/ui/widgets/order_summery_card.dart';

import '../../../../application/routes/app_route_const.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {

  final List<String> _options = ["Option1", "Option2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Order overview", style: Theme.of(context).textTheme.titleLarge,),
              const OrderSummaryCard(),

              Text("Shipping Address", style: Theme.of(context).textTheme.titleLarge,),
              Form(
                  child: Column(
                    spacing: 10,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Full name",
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Shipping address",
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,

                        decoration: const InputDecoration(
                          hintText: "Phone number",
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Add notes for delivery",
                        ),
                      )
              ],)),
              Text("Payment Methods", style: Theme.of(context).textTheme.titleLarge,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: RadioListTile(
                    title: Text("Cash on delivery",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),),
                    selected: true,
                    activeColor: AppColors.themeColor,
                    value: _options[0],
                  controlAffinity: ListTileControlAffinity.trailing,

                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: RadioListTile(
                    title: Text("Pay now",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),),
                    selected: true,
                    activeColor: AppColors.themeColor,
                    value: _options[0],
                  controlAffinity: ListTileControlAffinity.trailing,

                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onTapOrderConfirmScreen,
                    child: const Text("Place Order"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void onTapOrderConfirmScreen(){
    GoRouter.of(context).pushNamed(AppRouteConst.orderConfirmRouteName);
  }
}
