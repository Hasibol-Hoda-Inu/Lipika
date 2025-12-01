import 'package:flutter/material.dart';
import 'package:lipika/application/app_colors.dart';

import '../../../../application/assets_path.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AssetsPath.book, height: 120,),
            const SizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Walk into the shadow", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  const Text("Writer"),
                  const Spacer(),
                  Text("\$250", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton.filledTonal(
                    onPressed: (){},
                    icon: const Icon(Icons.delete_outline)
                ),
                const Spacer(),
                Row(
                  children: [
                    IconButton.filledTonal(onPressed: (){}, icon: const Icon(Icons.remove)),
                    const Text("1"),
                    IconButton.filledTonal(onPressed: (){}, icon: const Icon(Icons.add)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}