import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lipika/application/assets_path.dart';

import '../../../../application/app_colors.dart';

class BookViewSlider extends StatefulWidget {
  const BookViewSlider({
    super.key,
  });

  @override
  State<BookViewSlider> createState() => _BookViewSliderState();
}

class _BookViewSliderState extends State<BookViewSlider> {

  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 336.0,
              viewportFraction: 1,
              onPageChanged: (currentIndex, reason){
                _valueNotifier.value = currentIndex;
              }
          ),
          items: [1,2,3,4,5,6].map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: AppColors.borderColor,
                    ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 34),
                    child: Image.asset(AssetsPath.book, fit: BoxFit.contain,),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          left: 50,
          right: 50,
          child: ValueListenableBuilder(
              valueListenable: _valueNotifier,
              builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6,
                  children: [
                    for(int i = 0; i<6; i++)
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: value==i? AppColors.themeColor : Colors.grey.shade400,
                      )
                  ],
                );
              }
          ),
        ),
      ],
    );
  }
}