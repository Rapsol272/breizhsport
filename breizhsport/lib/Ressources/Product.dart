import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../View/ItemPage.dart';
import 'Cart.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final String? image;
  int quantity = 1;
  
  Product({required this.id ,required this.name, required this.price,required this.description , this.image });

  static Product fromSnapshot(DocumentSnapshot doc) {
    return Product(
      id: doc.id, //int
      name: doc.data().toString().contains('name') ? doc.get('name') : '', //String
      price: doc.data().toString().contains('price') ? doc.get('price') : '', //String
      description: doc.data().toString().contains('description') ? doc.get('description') : '', //String
      image: doc.data().toString().contains('image') ? doc.get('image') : '', //String
    );

  }
}

class ProductWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;
  final Cart cart;

  ProductWidget({required this.product, required this.onAddToCart , required this.cart});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
          return Card(
           //lien vers la page du produit
            child : InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(product: product , onAddToCart: onAddToCart , cart: cart)));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (product.image != null)
                  Container(
                    clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                    child:
                    Image.network(
                      product.image!,
                      //gestion dynamic de la taille de l'image
                      height: constraints.maxHeight * 0.5,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                  )),
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
