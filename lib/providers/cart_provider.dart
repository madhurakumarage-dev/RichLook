import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  static const _cartKey = 'saved_cart_items';

  final List<CartItem> _items = [];

  CartProvider() {
    _loadCart();
  }

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem(Product product, String size, Color color) {
    final existingIndex = _items.indexWhere(
      (item) =>
          item.product.id == product.id &&
          item.selectedSize == size &&
          item.selectedColor == color,
    );

    if (existingIndex >= 0) {
      _items[existingIndex].quantity += 1;
    } else {
      _items.add(
        CartItem(product: product, selectedSize: size, selectedColor: color),
      );
    }
    _saveCart();
    notifyListeners();
  }

  void removeItem(String productId, String size, Color color) {
    _items.removeWhere((item) =>
        item.product.id == productId &&
        item.selectedSize == size &&
        item.selectedColor == color);
    _saveCart();
    notifyListeners();
  }

  void updateQuantity(String productId, String size, Color color, int delta) {
    final index = _items.indexWhere((item) =>
        item.product.id == productId &&
        item.selectedSize == size &&
        item.selectedColor == color);
    if (index >= 0) {
      final newQuantity = _items[index].quantity + delta;
      if (newQuantity > 0) {
        _items[index].quantity = newQuantity;
      } else {
        _items.removeAt(index);
      }
      _saveCart();
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    _saveCart();
    notifyListeners();
  }

  double get subtotal {
    return _items.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  double get shipping {
    if (_items.isEmpty) return 0;
    return subtotal > 5000 ? 0 : 299.0;
  }

  double get total {
    return subtotal + shipping;
  }

  int get itemCount {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = _items.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList(_cartKey, cartData);
  }

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_cartKey) ?? [];
    _items
      ..clear()
      ..addAll(saved.map((item) => CartItem.fromJsonString(item)));
    notifyListeners();
  }
}
