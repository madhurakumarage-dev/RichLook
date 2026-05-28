import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../firebase_options.dart';
import '../models/cart_item.dart';
import '../models/order.dart' as app_models;

class FirebaseService {
  FirebaseService._();

  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static FirebaseAuth get auth => FirebaseAuth.instance;

  static FirebaseFirestore get firestore => FirebaseFirestore.instance;

  static FirebaseStorage get storage => FirebaseStorage.instance;

  static Future<void> placeOrder({
    required String userId,
    required List<CartItem> items,
    required double total,
    required String address,
    required String phone,
  }) async {
    final order = app_models.Order(
      id: '',
      userId: userId,
      items: items,
      total: total,
      status: 'Pending',
      address: address,
      phone: phone,
      createdAt: DateTime.now(),
    );
    await firestore.collection('orders').add(order.toMap());
  }

  static Stream<List<app_models.Order>> orderStream(String userId) {
    return firestore
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
          final orders = snapshot.docs
              .map((doc) => app_models.Order.fromMap(doc.id, doc.data()))
              .toList();
          // Sort by createdAt on client side
          orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
          return orders;
        });
  }
}
