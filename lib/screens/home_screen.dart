import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'Rings', 'icon': Icons.ring_volume},
      {'name': 'Necklaces', 'icon': Icons.celebration},
      {'name': 'Bracelets', 'icon': Icons.watch},
    ];

    final products = [
      {
        'name': 'Diamond Ring',
        'image': 'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=500',
        'price': '\$999',
      },
      {
        'name': 'Gold Necklace',
        'image': 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=500',
        'price': '\$799',
      },
      {
        'name': 'Pearl Bracelet',
        'image': 'https://images.unsplash.com/photo-1602751584552-8ba73aad10e1?w=500',
        'price': '\$599',
      },
      {
        'name': 'Sapphire Ring',
        'image': 'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=500',
        'price': '\$1299',
      },
      {
        'name': 'Crystal Necklace',
        'image': 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=500',
        'price': '\$899',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jewelry Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          categories[index]['icon'] as IconData,
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(categories[index]['name'] as String),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/product');
                  },
                  child: Card(
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(4),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(products[index]['image'] as String),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index]['name'] as String,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                products[index]['price'] as String,
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 