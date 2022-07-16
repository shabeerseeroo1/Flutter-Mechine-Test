part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splashScreen = _Paths.splashScreen;
  static const productScreen = _Paths.productScreen;
  static const settingsScreen = _Paths.settingsScreen;

}
abstract class _Paths {

  static const splashScreen = "/splash-screen";
  static const productScreen = "/product-screen";
  static const settingsScreen = "/settings-screen";

}
