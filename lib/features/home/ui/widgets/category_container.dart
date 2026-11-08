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

  static const Map<String, IconData> categoryIcons =
  <String, IconData>{
    'auto_stories': Icons.auto_stories,
    'menu_book': Icons.menu_book,
    'format_quote': Icons.format_quote,
    'school': Icons.school,
    'quiz': Icons.quiz,
    'science': Icons.science,
    'computer': Icons.computer,
    'history_edu': Icons.history_edu,
    'person_outline': Icons.person_outline,
    'business_center': Icons.business_center,
    'self_improvement': Icons.self_improvement,
    'psychology': Icons.psychology,
    'child_care': Icons.child_care,
    'collections_bookmark': Icons.collections_bookmark,
    'category': Icons.category,
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCategoryScreen,
      child: Container(
        width: 132,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(category.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                )),
              ),
            ),
            Icon(
              categoryIcons[category.iconName] ?? Icons.menu_book,
              size: 32,
              color: AppColors.themeColor,
            )
          ],
        ),
      ),
    );
  }
}