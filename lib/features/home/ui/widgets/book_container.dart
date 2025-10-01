import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';
import '../../../../application/assets_path.dart';

class BookContainer extends StatelessWidget {
  const BookContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderColor),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(AssetsPath.book, fit: BoxFit.cover,)),
          ),
          SizedBox(height: 8,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text("Walk into the shadow",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text("\$250", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.themeColor,
                fontSize: 20,
              )
              ),
            ],
          ),
          Text("Writer", style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}