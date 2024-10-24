import 'package:arabia_applicaltion/views/home/category/category_item.dart';
import 'package:flutter/material.dart';
import 'category_data.dart';

class Categoires extends StatefulWidget {
  const Categoires({super.key});

  @override
  State<Categoires> createState() => _CategoiresState();
}

class _CategoiresState extends State<Categoires> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        shrinkWrap: true,
        itemCount: CategoryData.categories.length,
        itemBuilder: (context, index) {
          final category = CategoryData.categories[index];
          return CategoryItem(
            name: category.name,
            image: category.image,
            backgroundColor: category.backgroundColor,
            title: category.title,
            onTap: () {
              if (category.route != null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => category.route!));
              }
            },
          );
        },
      ),
    );
  }
}
