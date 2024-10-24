import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String image;
  final Color backgroundColor;
  final String title;
  final VoidCallback onTap;

  const CategoryItem(
      {super.key,
      required this.name,
      required this.image,
      required this.backgroundColor,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          splashColor: kprimaryColor.withOpacity(0.2), // لون عند الضغط
          highlightColor: kprimaryColor.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 37.5,
                  backgroundColor: kBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(image),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  name,
                  style: styleMinButton,
                ),
                Text(
                  title,
                  style: styleCat,
                ),
              ],
            ),
          ),
        ));
  }
}
