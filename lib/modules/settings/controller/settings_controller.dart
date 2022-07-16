import 'package:flutter_mechine_test/modules/settings/model/notification_settings.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxList<NotificationSettings> mNotificationSettings =
      <NotificationSettings>[].obs;
  RxInt selectedParent = 0.obs;
  RxInt itemLength = 1.obs;
  RxBool hasItems = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  clearValues() {
    for (var element in mNotificationSettings) {
      element.isActive?.value = false;
    }
  }

  addToActive(value) {
    for (var element in mNotificationSettings) {
      element.notificationListSettings?.forEach((element) {
        if (value) {
          element.isActive?.value = true;
        } else {
          element.isActive?.value = false;
        }
      });
    }
    }

    init() {
      mNotificationSettings.value = [
        NotificationSettings(
            title: "Email Notification",
            isActive: false.obs,
            notificationListSettings: [
              NotificationListSettings(
                  title: "Order Updates", isActive: false.obs),
              NotificationListSettings(
                  title: "Shipping Updates", isActive: false.obs),
              NotificationListSettings(
                  title: "Promotions", isActive: false.obs),
              NotificationListSettings(title: "Offers", isActive: false.obs),
              NotificationListSettings(title: "News", isActive: false.obs),
              NotificationListSettings(title: "Messages", isActive: false.obs),
              NotificationListSettings(
                  title: "New Arrivals", isActive: false.obs)
            ]),
        NotificationSettings(
            title: "Push Notification",
            isActive: false.obs,
            notificationListSettings: [
            ]),
        NotificationSettings(
            title: "Notification at Night",
            isActive: false.obs,
            notificationListSettings: [
            ]),
      ];
    }
  }
