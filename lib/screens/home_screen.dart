 import 'package:flutter/material.dart';

class Category {
  final String name;
  final String imageUrl;
  final Color color;

  Category({
    required this.name,
    required this.imageUrl,
    required this.color,
  });
}

class Product {
  final String name;
  final String imageUrl;
  final String price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final List<Category> categories = [
    Category(
      name: 'Necklaces',
      imageUrl: 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=500',
      color: Colors.amber,
    ),
    Category(
      name: 'Rings',
      imageUrl: 'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=500',
      color: Colors.pink,
    ),
    Category(
      name: 'Bracelets',
      imageUrl: 'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=500',
      color: Colors.blue,
    ),
  ];

  final List<Product> products = [
    Product(
      name: 'Diamond Solitaire Ring',
      imageUrl: 'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=500',
      price: '\$999',
    ),
    Product(
      name: 'Gold Necklace',
      imageUrl: 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=500',
      price: '\$799',
    ),
    Product(
      name: 'Pearl Bracelet',
      imageUrl: 'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=500',
      price: '\$599',
    ),
    Product(
      name: 'Sapphire Ring',
      imageUrl: 'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=500',
      price: '\$1299',
    ),
    Product(
      name: 'Diamond Pendant',
      imageUrl: 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=500',
      price: '\$899',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jewelry Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return _buildCategoryCard(context, categories[index]);
                  },
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(context, products[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, Category category) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(category.imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black,
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            category.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(0, 1),
                  blurRadius: 2,
                  color: Colors.black,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.price,
                      style: TextStyle(
                        color: Colors.amber[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}