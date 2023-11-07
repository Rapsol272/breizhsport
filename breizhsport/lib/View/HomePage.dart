import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Ressources/Cart.dart';
import '../Ressources/Product.dart';
import 'CartPage.dart';
import 'LoginPage.dart';

class HomePage extends StatefulWidget {
  //create a list of products sweat shirt and others sport clothes
  final List<Product> products = [
    Product(name: 'Sweat Shirt', price: 29.99 , image: 'https://imgs.search.brave.com/FqwivKp0Naqcw0ZMVYtheGGa0NcdXm1KGHVhtI6RU-Y/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/NjAzNTM1ODE2NDEt/MzdiYWRkYWIwZmEy/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRC/OGZITm9iMlZ6ZkdW/dWZEQjhmREI4Zkh3/dyZ3PTEwMDAmcT04/MA'),
    Product(name: 'T-Shirt', price: 19.99),
    Product(name: 'Short', price: 14.99),
    Product(name: 'Socks', price: 9.99 , image: 'https://imgs.search.brave.com/tbqDSwtvHIXwmZFv3iPCKmsi2YVlaqwvpFkPwaiY8Os/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/MzE3S2VXdnpGYkwu/X0FDLl9TUjEyMCwx/MjAuanBn'),
    Product(name: 'Shoes', price: 49.99),
    Product(name: 'Gloves', price: 9.99),
    Product(name: 'Cap', price: 9.99),
    Product(name: 'Jacket', price: 39.99),
    Product(name: 'Pants', price: 29.99),
    Product(name: 'Belt', price: 9.99),
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
        title: Text('BreizhSport'),
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
      body: GridView.builder(
        itemCount: widget.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (BuildContext context, int index) {
          final product = widget.products[index];
          if (!_searchQuery.isEmpty && !product.name.contains(_searchQuery)) {
            return SizedBox.shrink();
          }
          return ProductWidget(
            product: product ,  
            onAddToCart: () {
              _cart.addItem(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Added to cart')),
              );
            },);
        },
      ),
      bottomNavigationBar: BottomAppBar(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'BreizhSport',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '© 2023 BreizhSport',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
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