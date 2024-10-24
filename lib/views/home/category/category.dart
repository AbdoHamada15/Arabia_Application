import 'package:flutter/material.dart';

class Category {
  final String name;
  final String image;
  final Color backgroundColor;
  final String title;
  final Widget? route;

  const Category({
    required this.name,
    required this.image,
    required this.backgroundColor,
    required this.title,
    this.route,
  });
}
