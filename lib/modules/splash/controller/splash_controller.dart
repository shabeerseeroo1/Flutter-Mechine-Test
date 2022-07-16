import 'dart:async';

import 'package:flutter_mechine_test/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    Timer(const Duration(seconds: 4), () {
      navigateToProducts();
    });
  }

  navigateToProducts() => Get.toNamed(Routes.productScreen);
}
