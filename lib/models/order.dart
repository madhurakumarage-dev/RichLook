import 'package:cloud_firestore/cloud_firestore.dart';

import 'cart_item.dart';

class Order {
  final String id;
  final String userId;
  final List<CartItem> items;
  final double total;
  final String status;
  final String address;
  final String phone;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.total,
    required this.status,
    required this.address,
    required this.phone,
    required this.createdAt,
  });

  factory Order.fromMap(String id, Map<String, dynamic> data) {
    final itemList = (data['items'] as List<dynamic>?) ?? [];
    return Order(
      id: id,
      userId: data['userId'] as String? ?? '',
      items: itemList.map((entry) {
        return CartItem.fromJson(Map<String, dynamic>.from(entry as Map));
      }).toList(),
      total: (data['total'] as num?)?.toDouble() ?? 0.0,
      status: data['status'] as String? ?? 'Pending',
      address: data['address'] as String? ?? '',
      phone: data['phone'] as String? ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'status': status,
      'address': address,
      'phone': phone,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
