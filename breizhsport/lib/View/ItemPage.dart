import 'package:flutter/material.dart';
import '../Ressources/Product.dart';
import '../Ressources/Cart.dart';


//fiche descriptive d'un produit
//avec un bloc image name prix ajouter une quantité et ajouter au panier
//puis un bloc avec la description du produit
class ItemPage extends StatefulWidget {
  final Product product;
  final VoidCallback onAddToCart;
  final Cart cart;

  ItemPage({required this.product , required this.onAddToCart , required this.cart});

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  late Product product;
  bool _isLoading = false;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }
  @override
  //avec un bloc image name prix ajouter une quantité et ajouter au panier
//puis un bloc avec la description du produit
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),

      body: SingleChildScrollView(
        child :_isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.02),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation: 5,
                    margin: EdgeInsets.all( MediaQuery.of(context).size.width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //ligne contenant image prix et ajouter au panier
                        Row(
                          children: [
                            if (product.image != null)
                              Container(
                                margin: EdgeInsets.all( MediaQuery.of(context).size.width * 0.01),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: MediaQuery.of(context).size.width * 0.4,
                                child : Image.network(
                                product.image!,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              )),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${product.price} €',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    //bouton pour modifier la quantité avec bouton plus et moins
                                    Row(
                                      children: [
                                        Text(
                                          'Quantité : ',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (quantity > 1) {
                                                quantity--;
                                              }
                                            });
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                        Text(
                                          quantity.toString(),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              quantity++;
                                            });
                                          },
                                          icon: Icon(Icons.add),
                                        ),

                                      ],
                                    ),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [                                        
                                        Expanded(
                                          flex: 0,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              widget.cart.addItem(product , quantity: quantity);
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('Added to cart')),
                                              );
                                            },
                                            child: Text(
                                              'Ajouter au panier',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                              ),
                                              
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            
                            ],
                          ),
                          //description du produit
                          Padding(
                            padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  product.description,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ]
                    ),
                  ),
                ],
              ),
            ),
    ),
    bottomNavigationBar : BottomAppBar(
                child: Container(
                  color: const Color(0xFFD84727),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'BreizhSport',
                        style: TextStyle(fontSize: ((MediaQuery.of(context).size.width+1000) / 400).floor() * 6, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height : ((MediaQuery.of(context).size.width+1000) / 400).floor()  * 1,
                        width: MediaQuery.of(context).size.width
                        ),
                      Text(
                        '© 2023 BreizhSport',
                        style: TextStyle(fontSize: ((MediaQuery.of(context).size.width+1000) / 400).floor()  * 3),
                      ),
                    ],
                  ),
                ),
            ),
    );
  }
}