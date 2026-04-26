import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final Color themeColor;
  final List<String> sizes;
  final List<Color> colors;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.themeColor,
    required this.sizes,
    required this.colors,
    required this.description,
  });
}
