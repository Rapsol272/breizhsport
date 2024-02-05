import 'Product.dart';
import 'package:flutter/material.dart';

class Cart {
  final List<Product> items = [];

  void addItem(Product product, {int quantity = 1}) {
    if (items.contains(product)) {
      items[items.indexWhere((element) => element == product)].quantity +=
          quantity;
    } else {
      product.quantity = quantity;
      items.add(product);
    }
  }

  void remove(Product product) {
    items.remove(product);
  }

  void clear() {
    items.clear();
  }

  double get total => items.fold(
      0, (total, current) => total + current.price * current.quantity);
  double get totalQuantity =>
      items.fold(0, (total, current) => total + current.quantity);
}

class AddToCartWidget extends StatelessWidget {
  final VoidCallback onAddToCart;
  final BoxConstraints constraints;

  const AddToCartWidget(
      {super.key, required this.onAddToCart, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onAddToCart,
      //bouton avec le texte "Ajouter au panier et un icone de panier"
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.shopping_cart),
          Text(
            'Ajouter au panier',
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
