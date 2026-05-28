import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../services/firebase_service.dart';
import '../models/product.dart';

/// Run this with:
/// flutter run --target=lib/tools/seed_products.dart
/// It initializes Firebase using your existing Firebase options and
/// writes a few sample documents into the `products` collection.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initialize();

  print('Firebase initialized — seeding products...');

  final products = <Product>[
    Product(
      id: '',
      name: 'Classic Shirt',
      price: 29.99,
      imageUrl: 'https://example.com/image.jpg',
      imagePath: null,
      category: 'Men',
      themeColor: const Color(0xFF1E88E5),
      sizes: const ['S', 'M', 'L'],
      colors: const [Color(0xFF1E88E5), Color(0xFFE53935)],
      description: 'Comfortable everyday shirt',
    ),
    Product(
      id: '',
      name: 'Modern Jacket',
      price: 79.99,
      imageUrl: 'https://example.com/jacket.jpg',
      imagePath: null,
      category: 'Women',
      themeColor: const Color(0xFF6A1B9A),
      sizes: const ['S', 'M', 'L', 'XL'],
      colors: const [Color(0xFF6A1B9A), Color(0xFF43A047)],
      description: 'Warm, fashionable jacket for everyday wear.',
    ),
    Product(
      id: '',
      name: 'Sport Sneakers',
      price: 59.99,
      imageUrl: 'https://example.com/sneakers.jpg',
      imagePath: null,
      category: 'Shoes',
      themeColor: const Color(0xFF3949AB),
      sizes: const ['8', '9', '10', '11'],
      colors: const [Color(0xFF3949AB), Color(0xFFF4511E)],
      description: 'Lightweight sneakers designed for comfort and style.',
    ),
  ];

  final firestore = FirebaseService.firestore;

  try {
    for (final p in products) {
      await firestore.collection('products').add(p.toMap());
      print('Added product: ${p.name}');
    }
    print('Seeding complete.');
  } catch (e, st) {
    print('Error while seeding products: $e');
    print(st);
    exitCode = 1;
  }

  // Exit so the flutter run process ends after seeding.
  exit(0);
}
