import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {required this.title,
      required this.onLeadingPress,
      this.onSettingPress,
      this.backGroundColor,
      this.isHasSettings = false,
      Key? key})
      : super(key: key);
  final Color? backGroundColor;
  final String title;
  final bool isHasSettings;
  final Function onLeadingPress;
  final Function? onSettingPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backGroundColor ?? Colors.white,
      title: Text(title),
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            onLeadingPress();
          }),
      actions: [
        isHasSettings
            ? IconButton(
                onPressed: () {
                  onSettingPress!();
                },
                icon: const Icon(
                  Icons.settings,
                  size: 22,
                ))
            : Container()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
