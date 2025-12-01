

import 'package:flutter/material.dart';

import 'dotted_divider.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}