import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String? image;
  
  
  Product({required this.name, required this.price , this.image});
}

class ProductWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  ProductWidget({required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (product.image != null)
                  Image.network(
                    product.image!,
                    height: 250,
                    width: 250,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),                    
                      ElevatedButton(
                        child: Text('Add to Cart'),
                        onPressed: onAddToCart,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}
