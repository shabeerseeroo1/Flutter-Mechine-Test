import 'package:flutter_mechine_test/modules/settings/controller/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
  Get.put(SettingsController());
  }

}
