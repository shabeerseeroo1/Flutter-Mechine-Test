import 'package:flutter/material.dart';
import 'package:flutter_mechine_test/modules/splash/bindings/splash_binding.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Test',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      initialBinding: SplashBinding(),
      getPages: AppPages.routes,
    );
  }
}
