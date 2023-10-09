import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import '../Ressources/Cart.dart';
import '../Ressources/Product.dart';
import 'CartPage.dart';
import 'LoginPage.dart';

class HomePage extends StatefulWidget {
  final List<Product> products = [
    Product(name: 'Product 1', price: 10),
    Product(name: 'Product 2', price: 20),
    Product(name: 'Product 3', price: 30),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Cart _cart = Cart();
  String _searchQuery = '';
    User? _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
        title: Text('Shopping Site'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              if (_user == null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage(cart: _cart)),
                );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final query = await showSearch(
                context: context,
                delegate: ProductSearchDelegate(products: widget.products),
              );
              setState(() {
                _searchQuery = query ?? '';
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = widget.products[index];
          if (!_searchQuery.isEmpty && !product.name.contains(_searchQuery)) {
            return SizedBox.shrink();
          }
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                _cart.addItem(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Added to cart')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductSearchDelegate extends SearchDelegate<String> {
  final List<Product> products;

  ProductSearchDelegate({required this.products});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products.where((product) => product.name.contains(query));
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        final product = results.elementAt(index);
        return ListTile(
          title: Text(product.name),
          subtitle: Text('\$${product.price}'),
          onTap: () {
            close(context, product.name);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products.where((product) => product.name.contains(query));
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        final product = suggestions.elementAt(index);
        return ListTile(
          title: Text(product.name),
          subtitle: Text('\$${product.price}'),
          onTap: () {
            query = product.name;
            close(context, product.name);
          },
        );
      },
    );
  }
}