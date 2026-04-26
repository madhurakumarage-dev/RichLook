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
        'A premium slim-fit polo shirt crafted from breathable cotton pique. Features the iconic embroidered logo on the chest, a ribbed collar, and two-button placket for a classic, sophisticated look.',
  ),
  const Product(
    id: '2',
    name: 'Light Blue Casual Suit',
    price: 3499.00,
    imageUrl:
        'https://images.unsplash.com/photo-1539109136881-3be0616acf4b?w=400',
    category: 'Women',
    themeColor: AppTheme.accentPink,
    sizes: ['S', 'M', 'L'],
    colors: [Colors.pink, Colors.white, Colors.black],
    description:
        'Elevate your professional and casual wardrobe with this elegantly tailored light blue suit. Made from lightweight, wrinkle-resistant fabric, it offers a comfortable fit with a modern, chic silhouette.',
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
        'Discover the ultimate blend of comfort and style with this urban streetwear ensemble. Featuring an oversized fit, bold graphic accents, and durable materials perfect for everyday city life.',
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
        'Breeze through the warm seasons in this stunning summer dress. Designed with a flattering A-line cut, lightweight fabric, and delicate straps, it is your go-to choice for sunny days and beach outings.',
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
        'An essential wardrobe staple, this classic white tee is made from ultra-soft, 100% organic cotton. Its relaxed fit and timeless crew neckline ensure maximum comfort and versatility for any casual occasion.',
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
        'A rugged yet stylish denim jacket that adds an edgy touch to any outfit. Crafted from premium vintage-washed denim, it features classic button details, chest pockets, and a comfortable regular fit.',
  ),
];
