import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lipika/application/assets_path.dart';

import '../../../../application/app_colors.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    super.key,
  });

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: AppColors.borderColor,
                      image: DecorationImage(image: AssetImage(AssetsPath.banner), fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 220,
                          child: Text("Explore the world through books",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    )
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
                        backgroundColor: value==i? AppColors.themeColor : Colors.grey.shade300,
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