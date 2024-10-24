import 'package:arabia_applicaltion/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed; // Make onPressed optional and nullable
  final double iconSize;
  final Color? color; // Make color customizable
  final EdgeInsetsGeometry padding;
  const KIcon(
      {super.key,
      required this.icon,
      this.onPressed,
      this.iconSize = 24,
      this.color,
      this.padding = const EdgeInsets.all(8)});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: FaIcon(icon, color: color ?? kbuttonColor),
      iconSize: iconSize,
      padding: padding,
    );
  }
}
