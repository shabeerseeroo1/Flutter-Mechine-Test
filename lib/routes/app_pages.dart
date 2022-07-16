import 'package:flutter_mechine_test/modules/product/bindings/product_binding.dart';
import 'package:flutter_mechine_test/modules/product/screen/product_screen.dart';
import 'package:flutter_mechine_test/modules/settings/bindings/settings_binding.dart';
import 'package:flutter_mechine_test/modules/settings/screen/settings_screen.dart';
import 'package:flutter_mechine_test/modules/splash/bindings/splash_binding.dart';
import 'package:get/get.dart';

import '../modules/splash/screen/splash_screen.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: _Paths.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding()
    ),
    GetPage(
        name: _Paths.productScreen,
        page: () => const ProductScreen(),
        binding: ProductBinding()
    ),
    GetPage(
        name: _Paths.settingsScreen,
        page: () => const SettingsScreen(),
        binding: SettingsBinding()
    ),

  ];
}
