import 'package:flutter/material.dart';

extension CustomWidget on Widget {
  Padding paddingCustom({double? horizontal, double? vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 0.0,
        vertical: vertical ?? 0.0,
      ),
      child: this,
    );
  }

  Padding paddingSpe(
      {double? top, double? bottom, double? right, double? left}) {
    return Padding(
      padding: EdgeInsets.only(
          top: top ?? 0.0,
          bottom: bottom ?? 0.0,
          right: right ?? 0.0,
          left: left ?? 0.0),
      child: this,
    );
  }
}
