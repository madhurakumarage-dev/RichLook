import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String? imagePath;
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
    this.imagePath,
    required this.category,
    required this.themeColor,
    required this.sizes,
    required this.colors,
    required this.description,
  });

  factory Product.fromMap(String id, Map<String, dynamic> data) {
    return Product(
      id: id,
      name: data['name'] as String? ?? '',
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: data['imageUrl'] as String? ?? '',
      imagePath: data['imagePath'] as String?,
      category: data['category'] as String? ?? 'All',
      themeColor: Color(data['themeColor'] as int? ?? 0xFF000000),
      sizes: List<String>.from(data['sizes'] as List<dynamic>? ?? <dynamic>[]),
      colors: (data['colors'] as List<dynamic>? ?? <dynamic>[]) 
          .map((e) => Color(e as int))
          .toList(),
      description: data['description'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'imagePath': imagePath,
      'category': category,
      'themeColor': themeColor.value,
      'sizes': sizes,
      'colors': colors.map((color) => color.value).toList(),
      'description': description,
    };
  }
}
