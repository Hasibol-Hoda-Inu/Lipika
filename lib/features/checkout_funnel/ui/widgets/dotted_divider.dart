import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  const DottedDivider({
    super.key,
    this.height = 1,
    this.color = Colors.grey,
    this.dotWidth = 4.0,
    this.spacing = 4.0,
  });

  final double height;
  final Color color;
  final double dotWidth;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (dotWidth + spacing)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dotWidth,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
