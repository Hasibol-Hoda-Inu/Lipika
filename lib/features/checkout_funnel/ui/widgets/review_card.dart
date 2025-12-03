import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';
import '../../../../application/assets_path.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AssetsPath.avatar, width: 32,),
        const SizedBox(width: 6,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),),
                  const Chip(
                    label: Text("5/5"),
                    avatar: Icon(
                      Icons.star_rounded,
                      color: AppColors.ratingColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const Text("Review Description",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("August 15, 2025"),
                  Text("11:45"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}