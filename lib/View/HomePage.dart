//import 'package:breizhsport/Services/ServicesProduct.dart';

import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Ressources/Cart.dart';
import '../Ressources/Product.dart';
import 'CartPage.dart';
import 'LoginPage.dart';
import 'ProfilPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Cart _cart = Cart();
  String _searchQuery = '';
  User? _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Stream<QuerySnapshot> _productsStream =
      FirebaseFirestore.instance.collection('products').snapshots();

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage('images/logo.png'),
          height: 48,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              if (_user == null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage(cart: _cart)),
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              if (_user == null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilPage()),
                );
              }
            },
          ),
          if (_user != null)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all((MediaQuery.of(context).size.width / 200) * 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //search bar
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Rechercher un produit',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _searchQuery = '';
                      });
                    },
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
              child: Title(
                  color: Colors.black,
                  child: Text(
                    'Produits',
                    style: TextStyle(
                        fontSize:
                            ((MediaQuery.of(context).size.width + 1000) / 400)
                                    .floor() *
                                6,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _productsStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong =/');
                  }

                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final List<DocumentSnapshot> documents = [];

                  // Pour chaque document, on vérifie qu'il matche
                  for (final document in snapshot.data!.docs) {
                    Map<String, dynamic> product =
                        document.data()! as Map<String, dynamic>;

                    if (product['name']
                        .toUpperCase()
                        .contains(_searchQuery.toUpperCase())) {
                      documents.add(document);
                    }
                  }

                  final int crossAxisCount =
                      ((MediaQuery.of(context).size.width / 300).floor() == 0
                          ? 1
                          : (MediaQuery.of(context).size.width / 300).floor());

                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: documents.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        final Product product =
                            Product.fromSnapshot(documents[index]);

                        return ProductWidget(
                          product: product,
                          cart: _cart,
                          onAddToCart: () {
                            _cart.addItem(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      '${product.name} a bien été ajouté au panier.')),
                            );
                          },
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: const Color(0xFFD84727),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '© 2024 BreizhSport',
                style: TextStyle(
                    fontSize: ((MediaQuery.of(context).size.width + 1000) / 400)
                            .floor() *
                        4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
