import 'package:flutter/material.dart';

class KButtonCustom extends StatefulWidget {
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final String text;
  final Color color;
  final double? borderRadius;
  final TextStyle? textStyle;

  const KButtonCustom(
      {super.key,
      required this.onTap,
      required this.width,
      required this.height,
      required this.text,
      required this.color,
      this.borderRadius,
      required this.textStyle});

  @override
  State<KButtonCustom> createState() => _KButtonCustomState();
}

class _KButtonCustomState extends State<KButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(
            onPressed: widget.onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ), // Background color
            ),
            child: Center(
              child: Text(
                widget.text,
                style: widget.textStyle,
              ),
            )),
      ),
    );
  }
}
