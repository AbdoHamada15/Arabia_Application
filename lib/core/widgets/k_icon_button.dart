import 'package:arabia_applicaltion/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../utils/app_style.dart';

class KIconButton extends StatefulWidget {
  final String title;
  final Image image;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double? imagePadding;
  const KIconButton(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap,
      this.backgroundColor,
      this.imagePadding});

  @override
  State<KIconButton> createState() => _KIconButtonState();
}

class _KIconButtonState extends State<KIconButton> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          CircleAvatar(
              backgroundColor: widget.backgroundColor ?? kprimaryColor,
              radius: 17,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.image,
              )),
          SizedBox(
            height: height * 0.001,
          ),
          Text(
            widget.title,
            style: styleMin2,
          ),
        ],
      ),
    );
  }
}
