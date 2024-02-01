import 'Product.dart';
import 'package:flutter/material.dart';

class Cart {
  final List<Product> items = [];

  void addItem(Product product) {
    items.add(product);
  }

  void clear() {
    items.clear();
  }

  double get total => items.fold(0, (sum, item) => sum + item.price);
}

class AddToCartWidget extends StatelessWidget {
  final VoidCallback onAddToCart;
  final BoxConstraints constraints;

  AddToCartWidget({required this.onAddToCart , required this.constraints});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onAddToCart,
      //bouton avec le texte "Ajouter au panier et un icone de panier"
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_cart),
          SizedBox(
            height: constraints.maxHeight * 0.08
          ),
          Text('Ajouter au panier'  ,
          style: TextStyle(
            fontSize: (constraints.maxHeight * 0.05) * 0.7,
            fontWeight: FontWeight.bold,
          ),
          ),
        ],
      ),
    );
  }
}