const admin = require('firebase-admin');

// Replace with the path to your Firebase service account key JSON file.
// You can generate this in the Firebase Console under Project Settings -> Service accounts.
const serviceAccount = require('./serviceAccountKey.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const db = admin.firestore();

const products = [
  {
    name: 'Classic Shirt',
    price: 29.99,
    imageUrl: 'https://example.com/image.jpg',
    category: 'Men',
    themeColor: 0xFF1E88E5,
    sizes: ['S', 'M', 'L'],
    colors: [0xFF1E88E5, 0xFFE53935],
    description: 'Comfortable everyday shirt',
  },
  {
    name: 'Modern Jacket',
    price: 79.99,
    imageUrl: 'https://example.com/jacket.jpg',
    category: 'Women',
    themeColor: 0xFF6A1B9A,
    sizes: ['S', 'M', 'L', 'XL'],
    colors: [0xFF6A1B9A, 0xFF43A047],
    description: 'Warm, fashionable jacket for everyday wear.',
  },
  {
    name: 'Sport Sneakers',
    price: 59.99,
    imageUrl: 'https://example.com/sneakers.jpg',
    category: 'Shoes',
    themeColor: 0xFF3949AB,
    sizes: ['8', '9', '10', '11'],
    colors: [0xFF3949AB, 0xFFF4511E],
    description: 'Lightweight sneakers designed for comfort and style.',
  },
];

async function seedProducts() {
  try {
    const batch = db.batch();

    products.forEach((product) => {
      const docRef = db.collection('products').doc();
      batch.set(docRef, product);
    });

    await batch.commit();
    console.log('Seed complete: added', products.length, 'product documents.');
  } catch (error) {
    console.error('Error seeding products:', error);
  }
}

seedProducts();
