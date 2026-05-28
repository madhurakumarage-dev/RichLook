import 'dart:convert';

import 'package:flutter/material.dart';

import 'product.dart';

class CartItem {
  final Product product;
  int quantity;
  String selectedSize;
  Color selectedColor;

  CartItem({
    required this.product,
    this.quantity = 1,
    required this.selectedSize,
    required this.selectedColor,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': product.toMap()..['id'] = product.id,
      'quantity': quantity,
      'selectedSize': selectedSize,
      'selectedColor': selectedColor.value,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    final productData = Map<String, dynamic>.from(json['product'] as Map);
    final productId = productData.remove('id') as String? ?? '';
    return CartItem(
      product: Product.fromMap(productId, productData),
      quantity: json['quantity'] as int? ?? 1,
      selectedSize: json['selectedSize'] as String? ?? '',
      selectedColor: Color(json['selectedColor'] as int? ?? 0xFF000000),
    );
  }

  String toJsonString() => jsonEncode(toJson());

  factory CartItem.fromJsonString(String jsonString) {
    return CartItem.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
  }
}
