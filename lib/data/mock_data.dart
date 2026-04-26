import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';

final List<Product> mockProducts = [
  const Product(
    id: '1',
    name: 'Tommy Hilfiger Polo',
    price: 2399.00,
    imageUrl:
        'https://objectstorage.ap-mumbai-1.oraclecloud.com/n/softlogicbicloud/b/cdn/o/products/400-600/S26HMKT968S--1--1775820842.jpeg',
    category: 'Men',
    themeColor: AppTheme.accentOrange,
    sizes: ['S', 'M', 'L', 'XL'],
    colors: [Colors.black, Colors.orange, Colors.white],
    description:
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  ),
  const Product(
    id: '2',
    name: 'Pink Casual Suit',
    price: 3499.00,
    imageUrl:
        'https://images.unsplash.com/photo-1539109136881-3be0616acf4b?w=400',
    category: 'Women',
    themeColor: AppTheme.accentPink,
    sizes: ['S', 'M', 'L'],
    colors: [Colors.pink, Colors.white, Colors.black],
    description:
        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  const Product(
    id: '3',
    name: 'Urban Streetwear',
    price: 1899.00,
    imageUrl: 'https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?w=400',
    category: 'Men',
    themeColor: Color(0xFF8B8C89),
    sizes: ['M', 'L', 'XL'],
    colors: [Colors.grey, Colors.black, Colors.white],
    description:
        'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  const Product(
    id: '4',
    name: 'Summer Dress',
    price: 1299.00,
    imageUrl:
        'https://images.unsplash.com/photo-1581044777550-4cfa60707c03?w=400',
    category: 'Women',
    themeColor: Color(0xFFE2C4A2),
    sizes: ['S', 'M'],
    colors: [Colors.brown, Colors.white],
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  ),
  const Product(
    id: '5',
    name: 'Classic White Tee',
    price: 899.00,
    imageUrl:
        'https://images.unsplash.com/photo-1496747611176-843222e1e57c?w=400',
    category: 'Shirts',
    themeColor: Color(0xFF6B8E23),
    sizes: ['S', 'M', 'L', 'XL'],
    colors: [Colors.white, Colors.black, Colors.blue],
    description:
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  ),
  const Product(
    id: '6',
    name: 'Denim Jacket',
    price: 2899.00,
    imageUrl:
        'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?w=400',
    category: 'Women',
    themeColor: Color(0xFF4682B4),
    sizes: ['S', 'M', 'L'],
    colors: [Colors.blue, Colors.black],
    description:
        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
];
