import 'package:flutter/material.dart';

import '../View/ItemPage.dart';
import 'Cart.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String? image;
  
  
  Product({required this.id ,required this.name, required this.price,required this.description , this.image });
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
           //lien vers la page du produit
            child : InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(product: product)));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (product.image != null)
                    Image.network(
                      product.image!,
                      //gestion dynamic de la taille de l'image
                      height: constraints.maxHeight * 0.5,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: (constraints.maxHeight * 0.05) * 0.8,
                           fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.05),
                        Text(
                          '\$${product.price}',
                          style: TextStyle(
                            fontSize: (constraints.maxHeight * 0.05) * 0.7,
                            fontWeight: FontWeight.bold,
                            )
                        ),
                        //ajout de la description du produit limmite a 3 lignes
                        Text(
                          product.description,
                          maxLines: (constraints.maxWidth / 150).floor(),
                          style: TextStyle(
                            fontSize: (constraints.maxHeight * 0.05) * 0.6,
                            fontWeight: FontWeight.bold,
                            )
                        ),
                        SizedBox(height: constraints.maxHeight * 0.08),                    
                        AddToCartWidget( onAddToCart: onAddToCart , constraints : constraints)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
    );
  }
}
