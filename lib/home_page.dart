import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

const List<Product> sampleProducts = [
  Product(
    id: 'p1',
    name: 'Shampoo',
    imageUrl: 'https://picsum.photos/seed/p1/300',
    price: 6.99,
  ),
  Product(
    id: 'p2',
    name: 'Conditioner',
    imageUrl: 'https://picsum.photos/seed/p2/300',
    price: 7.49,
  ),
  Product(
    id: 'p3',
    name: 'Hair Oil',
    imageUrl: 'https://picsum.photos/seed/p3/300',
    price: 12.99,
  ),
  Product(
    id: 'p4',
    name: 'Beard Oil',
    imageUrl: 'https://picsum.photos/seed/p4/300',
    price: 9.99,
  ),
  Product(
    id: 'p5',
    name: 'Body Lotion',
    imageUrl: 'https://picsum.photos/seed/p5/300',
    price: 5.49,
  ),
  Product(
    id: 'p6',
    name: 'Face Cream',
    imageUrl: 'https://picsum.photos/seed/p6/300',
    price: 14.99,
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salone_Store'),
        backgroundColor: const Color.fromARGB(255, 197, 201, 206),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF061426), Color(0xFF0B2745)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: sampleProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.72,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final p = sampleProducts[index];
            return _ProductTile(product: p);
          },
        ),
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  final Product product;
  const _ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // simple details dialog
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(product.name),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  product.imageUrl,
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Text('\$${product.price.toStringAsFixed(2)}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Add to cart'),
              ),
            ],
          ),
        );
      },
      child: Card(
        color: const Color.fromRGBO(255, 255, 255, 0.06),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(product.imageUrl, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
