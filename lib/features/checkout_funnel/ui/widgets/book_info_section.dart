import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';

class BookInfoSection extends StatelessWidget {
  const BookInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        const Chip(
          label: Text("Natural Science"),

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Book Name", style: Theme.of(context).textTheme.titleLarge,),
            Text("\$ 150", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.themeColor),),
          ],
        ),
        const Divider(thickness: 6, color: AppColors.borderColor,),
        const Row(
          spacing: 60,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Stock"),
                Text("Publisher"),
                Text("Writer"),
                Text("Language"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("In Stock"),
                Text("Huda Enu"),
                Text("Abdul Monem"),
                Text("Bangladesh"),
              ],
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                side: const BorderSide(
                  color: AppColors.borderColor,
                ),
                foregroundColor: AppColors.themeColor,
              ),
              child: const Text("View More Details")),
        ),
        const Divider(thickness: 6, color: AppColors.borderColor),
        Text("Description", style: Theme.of(context).textTheme.titleLarge,),
        const Text("Book Description",
          maxLines: 8,
          overflow: TextOverflow.ellipsis,
        ),
        const Divider(thickness: 6, color: AppColors.borderColor),
      ],
    );
  }
}