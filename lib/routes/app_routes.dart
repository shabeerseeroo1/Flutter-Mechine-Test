part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splashScreen = _Paths.splashScreen;
  static const productScreen = _Paths.productScreen;

}
abstract class _Paths {

  static const splashScreen = "/splash-screen";
  static const productScreen = "/product-screen";

}
