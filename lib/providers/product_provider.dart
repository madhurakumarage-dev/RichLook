import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../models/product.dart';
import '../services/firebase_service.dart';

class ProductProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseService.firestore;

  final List<Product> _products = [];
  bool isLoading = true;
  String selectedCategory = 'All';

  ProductProvider() {
    _loadProducts();
  }

  List<Product> get products => List.unmodifiable(_products);

  List<String> get categories {
    final categorySet = <String>{'All'};
    categorySet.addAll(_products.map((p) => p.category));
    return categorySet.toList();
  }

  List<Product> get filteredProducts {
    if (selectedCategory == 'All') {
      return products;
    }
    return products.where((product) => product.category == selectedCategory).toList();
  }

  Future<void> _loadProducts() async {
    try {
      isLoading = true;
      notifyListeners();
      final snapshot = await _firestore.collection('products').orderBy('name').get();
      _products.clear();
      if (snapshot.docs.isNotEmpty) {
        _products
          ..addAll(snapshot.docs.map((doc) => Product.fromMap(doc.id, doc.data())));
      } else {
        _products.addAll(mockProducts);
      }
    } catch (_) {
      _products.clear();
      _products.addAll(mockProducts);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshProducts() async {
    await _loadProducts();
  }

  void setCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }
}
