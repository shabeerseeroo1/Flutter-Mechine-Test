
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet{

  static void showBottomSheet(
      Widget child, {
        bool isDismissible = false,
      }) {
    Get.bottomSheet(
      IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
          child: child,
        ),
      ),
      isDismissible: isDismissible,
      elevation: 10.0,
    );
  }
}