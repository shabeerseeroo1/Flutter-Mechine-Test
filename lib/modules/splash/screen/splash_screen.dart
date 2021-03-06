import 'package:flutter/material.dart';
import 'package:flutter_mechine_test/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../contstants/app_strings.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _bodyView());
  }

  Container _bodyView() {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: _buildText(),
    );
  }

  Text _buildText() {
    return Text(
     AppStrings.splashTitle,
      style: GoogleFonts.roboto(
          color: AppColors.primaryColor, fontSize: 35, fontWeight: FontWeight.w900),
    );
  }
}
