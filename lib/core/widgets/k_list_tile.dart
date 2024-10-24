import 'package:flutter/material.dart';

import '../utils/app_style.dart';

class KListTile extends StatefulWidget {
  final String leadingImagePath;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;

  const KListTile({
    super.key,
    required this.leadingImagePath,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  State<KListTile> createState() => _KListTileState();
}

class _KListTileState extends State<KListTile> {
  String? trailingText;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(widget.leadingImagePath, width: 21, height: 21),
      title: Text(
        widget.title,
        style: styleTitle11,
      ),
      trailing: widget.trailing ??
          Image.asset(
            "assets/next_arrow.png",
            width: 20,
            height: 20,
          ),
      onTap: widget.onTap,
    );
  }
}
