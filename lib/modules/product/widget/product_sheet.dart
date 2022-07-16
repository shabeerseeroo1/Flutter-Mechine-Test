import 'package:flutter/material.dart';
import 'package:flutter_mechine_test/modules/product/widget/rating_widget.dart';
import 'package:flutter_mechine_test/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductSheet extends StatelessWidget {
  const ProductSheet(
      {required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.rating,
      Key? key})
      : super(key: key);
  final String title;
  final String price;
  final String description;
  final String category;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return _buildSingleChildScrollView();
  }

  SingleChildScrollView _buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText(
              name: title,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18),
          const Divider(),
          _buildSizedBox(height: 10),
          Align(
            alignment: Alignment.topRight,
            child: _buildText(
                name: category,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                textAlign: TextAlign.justify,
                fontSize: 14),
          ),
          _buildSizedBox(height: 10),
          _buildText(
              name: description,
              fontWeight: FontWeight.w500,
              color: AppColors.lightGrey,
              textAlign: TextAlign.justify,
              fontSize: 13),
          _buildSizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildText(
                  name: "\$$price",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 14),
              RatingWidget(rating: rating)
            ],
          ),
          _buildSizedBox(height: 14),
        ],
      ),
    );
  }

  Text _buildText(
      {required String name,
      double? fontSize,
      FontWeight? fontWeight,
      TextAlign? textAlign,
      Color? color}) {
    return Text(
      name,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }

  SizedBox _buildSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? 0.0,
      width: width ?? 0.0,
    );
  }
}
