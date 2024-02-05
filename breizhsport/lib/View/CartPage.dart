import 'package:flutter/material.dart';
import '../Ressources/Cart.dart';
import 'PaymentPage.dart';

class CartPage extends StatelessWidget {
  final Cart cart;

  CartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      //liste des produits dans le panier
      body: Padding(
        padding: EdgeInsets.all( (MediaQuery.of(context).size.width / 200) * 4),
        child:   
      Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Image.network(
                            item.image!,
                            height: MediaQuery.of(context).size.width * 0.2,
                            fit: BoxFit.cover,
                          ),
                          title: Text(item.name),
                          subtitle: Text('Price: ${item.price}€'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  cart.remove(item);
                                },
                              ),
                              Text(item.quantity.toString()),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  cart.addItem(item);
                                },
                              ),
                              //affichage du prix total pour chaque produit
                              Text('Total: ${item.price * item.quantity}€'),
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
          margin: EdgeInsets.all( MediaQuery.of(context).size.width * 0.02),
          elevation: 5,
          child: Column(
            children: [
              SizedBox(
                width : MediaQuery.of(context).size.width * 0.2,
                ),
              Text('Sous-Total: ${cart.total}€',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
                            Text('Articles: ${cart.totalQuantity}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(cart: cart)));
                },
                  child: Row(
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
      )
      )
    );
  }
}