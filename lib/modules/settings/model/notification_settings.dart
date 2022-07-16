import 'package:get/get.dart';

class NotificationSettings {
  String?title;
  RxBool?isActive;
  List<NotificationListSettings>? notificationListSettings;

  NotificationSettings({ required this.title,required this.notificationListSettings,required this.isActive});
}

class NotificationListSettings {
  String? title;
  RxBool? isActive;

  NotificationListSettings({required this.title, required this.isActive});
}
