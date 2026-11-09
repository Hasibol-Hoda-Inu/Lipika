import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';
import '../../data/models/book_upload_action.dart';

class ChooseOptions extends StatelessWidget {
  const ChooseOptions({
    super.key,
    required this.selectedAction,
    required this.onChanged,
  });

  final BookUploadAction selectedAction;
  final ValueChanged<BookUploadAction> onChanged;

  static const Map<BookUploadAction, String> _options = {
    BookUploadAction.sell: "Sell",
    BookUploadAction.swap: "Swap",
    BookUploadAction.donate: "Donate",
    BookUploadAction.lend: "Lend",
    BookUploadAction.library: "Add to My Library",
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What would you like to do with this book?",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 20),
        ),
        const SizedBox(height: 20),
        Column(
          spacing: 10,
          children: [
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: buildOptionTile(BookUploadAction.sell),
                ),
                Expanded(
                  child: buildOptionTile(BookUploadAction.swap),
                ),
                Expanded(
                  child: buildOptionTile(BookUploadAction.donate),
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: buildOptionTile(BookUploadAction.lend),
                ),
                Expanded(
                  flex: 2,
                  child: buildOptionTile(BookUploadAction.library),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }


  Widget buildOptionTile(BookUploadAction action) {
    final bool isSelected = selectedAction == action;
    return SizedBox(
      height: 55,
      child: Material(
        color: isSelected
            ? AppColors.themeColor
            : AppColors.borderColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => onChanged(action),
          child: Center(
            child: Text(
              _options[action]!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : AppColors.themeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
