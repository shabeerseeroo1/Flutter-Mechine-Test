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
    ),

  ];
}
