import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';

class ChooseOptions extends StatefulWidget {
  const ChooseOptions({
    super.key,
  });

  @override
  State<ChooseOptions> createState() => _ChooseOptionsState();
}

class _ChooseOptionsState extends State<ChooseOptions> {

  bool? isSelected;
  int? selectedIndex;
  List<String> options = [
    "Add to my Library",
    "Sell it",
    "Swap it",
    "Give it away",
    "Give it away",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What are you willing to?",
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 160,
          child: GridView.builder(
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              isSelected = selectedIndex == index;
              return InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected! ? AppColors.themeColor : AppColors.borderColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(options[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      color: isSelected! ? Colors.white : AppColors.themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}