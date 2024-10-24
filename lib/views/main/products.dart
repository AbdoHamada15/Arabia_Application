import 'package:flutter/material.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/app_style.dart';
import '../home/category/categories_screen.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height * 0.008,
            ),
            Center(
              child: Image.asset(
                'assets/logo.png',
                height: 100,
                width: 150,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text('Get a Quote', style: styleCat),
            const Categoires(),
          ],
        ),
      ),
    );
  }
}
