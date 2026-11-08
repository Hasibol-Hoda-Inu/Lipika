import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../application/app_colors.dart';
import '../../../../application/assets_path.dart';
import '../../../category/data/models/category_model.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.onTapCategoryScreen,
    required this.category,
  });
  final CategoryModel category;
  final VoidCallback onTapCategoryScreen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCategoryScreen,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Column(
          spacing: 24,
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .start,
          children: [
            Text(category.name, style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 18,
            )),
            SvgPicture.asset(AssetsPath.natural, width: 36, height: 36,),
          ],
        ),
      ),
    );
  }
}