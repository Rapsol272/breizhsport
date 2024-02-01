//item page for a product

import 'package:flutter/material.dart';
import '../Ressources/Product.dart';
import '../Ressources/Cart.dart';
import '../Services/ServicesProduct.dart';
import 'CartPage.dart';

class ItemPage extends StatefulWidget {
  final Product product;

  ItemPage({required this.product});

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  late Product product;
  late Cart cart;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16),
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$${product.price}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          child: Text('Add to Cart'),
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            await ServicesProduct().getProduct(1);
                            cart.addItem(product);
                            setState(() {
                              _isLoading = false;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CartPage(cart: cart)));
                          },
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