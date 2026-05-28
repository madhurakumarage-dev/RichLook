import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../providers/cart_provider.dart';
import '../theme/app_theme.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  Widget _buildProductImage() {
    if (item.product.imageUrl.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: item.product.imageUrl,
        fit: BoxFit.cover,
      );
    }
    if (item.product.imagePath != null && item.product.imagePath!.isNotEmpty) {
      return FutureBuilder<String>(
        future: FirebaseStorage.instance.ref(item.product.imagePath!).getDownloadURL(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return CachedNetworkImage(
              imageUrl: snapshot.data!,
              fit: BoxFit.cover,
            );
          }
          return const Icon(Icons.image_not_supported);
        },
      );
    }
    return const Icon(Icons.image_not_supported);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          Container(
            width: 60,
            height: 80,
            decoration: BoxDecoration(
              color: item.product.themeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: _buildProductImage(),
            ),
          ),
          const SizedBox(width: 16),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  item.selectedSize,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Rs. ${item.product.price.toStringAsFixed(0)}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),

          // Quantity Control
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.textSecondary.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, size: 16),
                  onPressed: () {
                    context.read<CartProvider>().updateQuantity(
                          item.product.id,
                          item.selectedSize,
                          item.selectedColor,
                          -1,
                        );
                  },
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  padding: EdgeInsets.zero,
                ),
                Text(
                  '${item.quantity}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                IconButton(
                  icon: const Icon(Icons.add, size: 16),
                  onPressed: () {
                    context.read<CartProvider>().updateQuantity(
                          item.product.id,
                          item.selectedSize,
                          item.selectedColor,
                          1,
                        );
                  },
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
