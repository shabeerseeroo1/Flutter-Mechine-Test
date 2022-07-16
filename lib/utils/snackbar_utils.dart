import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void showErrorSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16));
  }

  static void showSuccessSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blueGrey,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16));
  }

}