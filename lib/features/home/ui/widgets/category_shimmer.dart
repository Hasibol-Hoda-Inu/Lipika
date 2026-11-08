import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';

class CategoryShimmer extends StatefulWidget {
  const CategoryShimmer({super.key});

  @override
  State<CategoryShimmer> createState() =>
      _CategoryShimmerState();
}

class _CategoryShimmerState extends State<CategoryShimmer>
    with SingleTickerProviderStateMixin {

  late final AnimationController _animation =
  AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            final double position = _animation.value * 4;

            return LinearGradient(
              begin: Alignment(-2 + position, 0),
              end: Alignment(-1 + position, 0),
              colors: [
                AppColors.borderColor,
                Theme.of(context).colorScheme.surface,
                AppColors.borderColor,
              ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: child,
        );
      },
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 100,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
        separatorBuilder: (
            BuildContext context,
            int index,
            ) {
          return const SizedBox(width: 12);
        },
      ),
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}
