import 'package:flutter/material.dart';
import '../Ressources/Cart.dart';
import 'PaymentPage.dart';

class CartPage extends StatefulWidget {
  final Cart cart;

  CartPage({required this.cart});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mon panier'),
        ),
        //liste des produits dans le panier
        body: Padding(
            padding:
                EdgeInsets.all((MediaQuery.of(context).size.width / 200) * 4),
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cart.items.length,
                    itemBuilder: (context, index) {
                      final item = widget.cart.items[index];
                      return Row(
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 5,
                              child: ListTile(
                                leading: Image.network(
                                  item.image!,
                                  height:
                                      MediaQuery.of(context).size.width * 0.2,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(item.name),
                                subtitle: Text(
                                    'Price: ${item.price.toStringAsFixed(2)}€'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          if (item.quantity > 1)  
                                            item.quantity--;
                                          else
                                            widget.cart.remove(item);

                                        });
                                      },
                                    ),
                                    Text(item.quantity.toString()),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          item.quantity++;
                                        });
                                      },
                                    ),
                                    //affichage du prix total pour chaque produit
                                    Text(
                                        'Total: ${(item.price * item.quantity).toStringAsFixed(2)}€'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //card pour afficher le prix total du panier et le bouton pour aller à la page de paiement
                        ],
                      );
                    },
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  elevation: 5,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 32,
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Text(
                        'Sous-Total: ${widget.cart.total.toStringAsFixed(2)}€',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text('Articles: ${widget.cart.totalQuantity}'),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentPage(cart: widget.cart)));
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check),
                            Text('Valider le panier'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
