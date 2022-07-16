import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter_mechine_test/common_widgets/custom_appbar.dart';
import 'package:flutter_mechine_test/modules/settings/controller/settings_controller.dart';
import 'package:flutter_mechine_test/modules/settings/model/notification_settings.dart';
import 'package:flutter_mechine_test/utils/app_colors.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../contstants/app_strings.dart';
import 'package:flutter_mechine_test/extension/common_widget.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppbar(),
      body: _bodyView(context),
    );
  }

  CustomAppbar buildCustomAppbar() {
    return CustomAppbar(
      title: AppStrings.settingTitle,
      onLeadingPress: () {
        Get.back();
      },
      backGroundColor: AppColors.lightGrey,
    );
  }

  _bodyView(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          buildParentList(),
          Obx(
            () => controller.hasItems.value ? buildSubList() : Container(),
          )
        ],
      ),
    ).paddingCustom(vertical: 10, horizontal: 10);
  }

  Card buildSubList() {
    return Card(
        elevation: 1.0,
        color: AppColors.cardColor,
        child: buildSubListColumnItem()
            .paddingCustom(vertical: 10, horizontal: 10));
  }

  Card buildParentList() {
    return Card(
      elevation: 1.0,
      color: AppColors.cardColor,
      child:
          buildParentColumnItem().paddingCustom(horizontal: 10, vertical: 12),
    );
  }

  Column buildParentColumnItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText(
            title: AppStrings.notificationSettings,
            fontColor: AppColors.headerColor,
            fontWeight: FontWeight.w500,
            fontSize: 17.5),
        buildSizedBox(height: 10),
        Obx(() => ListView.builder(
            padding: const EdgeInsets.only(bottom: 25),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: controller.mNotificationSettings.length,
            itemBuilder: (context, index) {
              var item = controller.mNotificationSettings[index];
              return Obx(() =>
                      buildRow(item, index, AppColors.listSubTitleColor, 15))
                  .paddingCustom(vertical: 10);
            })),
      ],
    );
  }

  Column buildSubListColumnItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText(
            title: AppStrings.notificationSettings,
            fontColor: AppColors.headerColor,
            fontWeight: FontWeight.w500,
            fontSize: 17.5),
        buildSizedBox(height: 10),
        ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 5),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: controller.itemLength.value,
            itemBuilder: (context, index) {
              var item = controller
                  .mNotificationSettings[controller.selectedParent.value];
              return Obx(() => Column(
                    children: [
                      buildRow(item, index, AppColors.listHeaderColor, 16)
                          .paddingSpe(
                        left: 0,
                        right: 25,
                      ),
                      ListView.builder(
                          padding: const EdgeInsets.only(top: 8, bottom: 5),
                          physics: const ClampingScrollPhysics(),
                          itemCount: controller
                              .mNotificationSettings[
                                  controller.selectedParent.value]
                              .notificationListSettings
                              ?.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i2) {
                            var subItem = item.notificationListSettings![i2];
                            return Obx(() => buildRowSublist(subItem)
                                .paddingCustom(vertical: 8, horizontal: 23));
                          }),
                    ],
                  ));
            }),
      ],
    );
  }

  Row buildRow(
      NotificationSettings item, int index, Color color, double fontSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildText(
            title: item.title,
            fontSize: fontSize,
            fontColor: color,
            fontWeight: FontWeight.w500),
        buildAnimatedToggleSwitchParent(item, index),
      ],
    );
  }

  AnimatedToggleSwitch<bool> buildAnimatedToggleSwitchSubList(
      NotificationListSettings item) {
    return AnimatedToggleSwitch<bool>.dual(
      borderRadius: BorderRadius.circular(6),
      innerColor: AppColors.switchBackGround,
      current: item.isActive?.value ?? false,
      first: false,
      second: true,
      dif: 0.0,
      borderColor: Colors.transparent,
      borderWidth: 1.0,
      height: 30,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 1.5),
        ),
      ],
      onChanged: (value) {
        item.isActive?.value = value;
      },
      colorBuilder: (v) => Colors.transparent,
      iconBuilder: (value) => value
          ? buildNeumorphicIcon(
              icon: Icons.ac_unit_outlined,
            )
          : buildNeumorphicIcon(
              icon: Icons.ac_unit_outlined,
            ),
      textBuilder: (value) => value
          ? Center(
              child: _buildText(
                  title: AppStrings.on,
                  fontColor: AppColors.switchON,
                  fontWeight: FontWeight.bold))
          : Center(
              child: _buildText(
                  title: AppStrings.off,
                  fontColor: AppColors.switchOff,
                  fontWeight: FontWeight.bold)),
    );
  }

  AnimatedToggleSwitch<bool> buildAnimatedToggleSwitchParent(
      NotificationSettings item, int index) {
    return AnimatedToggleSwitch<bool>.dual(
      borderRadius: BorderRadius.circular(6),
      innerColor: AppColors.switchBackGround,
      current: item.isActive?.value ?? false,
      first: false,
      second: true,
      dif: 0.0,
      borderColor: Colors.transparent,
      borderWidth: 1.0,
      height: 30,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 1.5),
        ),
      ],
      onChanged: (value) {
        if (value &&
            item.notificationListSettings != null &&
            item.notificationListSettings!.isNotEmpty) {
          controller.hasItems(true);
        } else {
          controller.hasItems(false);
        }
        controller.clearValues();
        item.isActive?.value = value;
        controller.selectedParent.value = index;
        controller.addToActive(value);

        print('Length == ${item.notificationListSettings?.length}');
      },
      colorBuilder: (v) => Colors.transparent,
      iconBuilder: (value) => value
          ? buildNeumorphicIcon(
              icon: Icons.ac_unit_outlined,
            )
          : buildNeumorphicIcon(
              icon: Icons.ac_unit_outlined,
            ),
      textBuilder: (value) => value
          ? Center(
              child: _buildText(
                  title: AppStrings.on,
                  fontColor: AppColors.switchON,
                  fontWeight: FontWeight.bold))
          : Center(
              child: _buildText(
                  title: AppStrings.off,
                  fontColor: AppColors.switchOff,
                  fontWeight: FontWeight.bold)),
    );
  }

  NeumorphicIcon buildNeumorphicIcon({required IconData icon}) {
    return NeumorphicIcon(
      icon,
      style:  NeumorphicStyle(
        color: Colors.white,
        shape: NeumorphicShape.flat,
        boxShape:
        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      size: 27,
    );
  }

  Row buildRowSublist(NotificationListSettings item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildText(
            title: item.title,
            fontSize: 15,
            fontColor: AppColors.listSubTitleColor,
            fontWeight: FontWeight.w500),
        buildAnimatedToggleSwitchSubList(item),
      ],
    );
  }

  Text _buildText(
      {required title,
      double? fontSize,
      Color? fontColor,
      FontWeight? fontWeight}) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          color: fontColor, fontSize: fontSize, fontWeight: fontWeight),
    );
  }

  SizedBox buildSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? 0.0,
      width: width ?? 0.0,
    );
  }
}
