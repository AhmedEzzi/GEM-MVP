import 'package:flutter/material.dart';

import '../../generated/assets.gen.dart';

class BottomNavBarData {
  final String title;
  final String? iconPath;
  final Widget? icon;

  const BottomNavBarData({
    required this.title,
    this.iconPath,
    this.icon,
  }) : assert(
          iconPath != null || icon != null,
          "Icon or iconPath must be provided",
        );

  static List<BottomNavBarData> get navBarData {
    return [
      BottomNavBarData(
        iconPath: Assets.svg.linear.path,
        title: '',
      ),
      BottomNavBarData(
        iconPath: Assets.svg.map.path,
        title: '',
      ),
      BottomNavBarData(
        iconPath: Assets.svg.icon.path,
        title: '',
      ),
      BottomNavBarData(
        iconPath: Assets.svg.user.path,
        title: '',
      ),
    ];
  }
}
