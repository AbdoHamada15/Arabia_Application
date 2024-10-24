import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class KAppBar extends StatefulWidget {
  const KAppBar({super.key});

  @override
  State<KAppBar> createState() => _KAppBarState();
}

class _KAppBarState extends State<KAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            "assets/moon.png",
            width: 23,
            height: 23,
          ),
        ),
        const SizedBox(
          width: 60,
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            "assets/logo.png",
            width: 160,
            height: 95,
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        const Text(
          "عربي",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: kSecondryColor),
        )
      ],
    );
  }
}
