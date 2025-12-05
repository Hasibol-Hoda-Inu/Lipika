import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';

class TopicSelector extends StatefulWidget {
  const TopicSelector({super.key});

  @override
  State<TopicSelector> createState() => _TopicSelectorState();
}

class _TopicSelectorState extends State<TopicSelector> {
  
  final List<Map<String, dynamic>> topics = [
    {'label': 'Social Science', 'icon': Icons.emoji_emotions_outlined},
    {'label': 'Romantic', 'icon': Icons.favorite_border},
    {'label': 'Math', 'icon': Icons.calculate_outlined},
    {'label': 'Natural Science', 'icon': Icons.science_outlined},
    {'label': 'English Language', 'icon': Icons.translate},
  ];

  final List<String> _selectedTopics = [];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "Favourite Topics",
            style: Theme.of(context).textTheme.titleMedium,

            children: [
              TextSpan(
                text: "(Select max 3)",
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
        Wrap(
          spacing: 10,
          children: [
            ...topics.map((topic) {
              final bool isSelected = _selectedTopics.contains(topic['label']);

              return ChoiceChip(
                label: Text(topic['label']),
                avatar: Icon(topic['icon']),
                showCheckmark: false,
                side: BorderSide(
                  color: isSelected ? AppColors.themeColor : Colors.grey,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                selected: isSelected,
                onSelected: (bool selected){
                  setState(() {
                    if(selected){
                      if(_selectedTopics.length < 3){
                        _selectedTopics.add(topic['label']);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("You can select max 3 topics"),
                            backgroundColor: AppColors.themeColor,
                          ),
                        );
                      }
                    }else{
                      _selectedTopics.remove(topic['label']);
                    }
                  });
                },
              );
            }),
          ],
        ),
        ActionChip(
          label: const Text("More"),
          labelStyle: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
          onPressed: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          side: const BorderSide(
            color: AppColors.themeColor,
          ),
        ),
      ],
    );
  }
  void onTap(){
    debugPrint(_selectedTopics.toString());
  }
}
