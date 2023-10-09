import 'package:flutter/material.dart';

import '../Ressources/Cart.dart';

class CartPage extends StatelessWidget {
  final Cart cart;

  CartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(cart.items[index].name),
            subtitle: Text('\$${cart.items[index].price}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total: \$${cart.total}',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('Checkout'),
                onPressed: () {
                  // TODO: Implement checkout logic
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}