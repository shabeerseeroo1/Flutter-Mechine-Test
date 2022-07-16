import 'package:flutter/material.dart';
import 'package:flutter_mechine_test/utils/app_colors.dart';

class RatingWidget extends StatelessWidget {
  final String rating;
  final Color? textColor;
  const RatingWidget({
    Key? key,
    required this.rating,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildWrap();
  }

  Wrap buildWrap() {
    return Wrap(
    children: [
      const Icon(
        Icons.star,
        color: AppColors.starFillColor,
        size: 14,
      ),
      const SizedBox(
        width: 5.0,
      ),
      Text(
        rating,
        style: TextStyle(color: textColor ?? Colors.black),
      )
    ],
  );
  }
}
