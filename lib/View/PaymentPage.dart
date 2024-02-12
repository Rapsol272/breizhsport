import 'package:breizhsport/Ressources/Payment.dart';
import 'package:flutter/material.dart';
import '../Ressources/Cart.dart';

class PaymentPage extends StatefulWidget {
  final Cart cart;

  PaymentPage({required this.cart});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Adresse facturation
  final TextEditingController _adresseFacturationController =
      TextEditingController();
  final TextEditingController _cpFacturationController =
      TextEditingController();
  final TextEditingController _villeFacturationController =
      TextEditingController();

  // Adresse livraison
  final TextEditingController _adresseLivraisonController =
      TextEditingController();
  final TextEditingController _cpLivraisonController = TextEditingController();
  final TextEditingController _villeLivraisonController =
      TextEditingController();

  // Carte
  final TextEditingController _numeroCarteController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  final TextEditingController _dateFinController = TextEditingController();
  final TextEditingController _nomCarteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Validation de la commande'),
    //   ),
    //   body: Padding(
    //     padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.02),
    //     child: Row(
    //       children: [
    //         Expanded(
    //           child:
    //         //formulaire d'adresse
    //         Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             const Text('Adresse de livraison'),
    //             Form(
    //               key: _formKey,
    //               child: Column(
    //                 children: [
    //                   TextFormField(
    //                     decoration:const InputDecoration(
    //                       labelText: 'Adresse',
    //                     ),
    //                     validator: (value) {
    //                       if (value == null || value.isEmpty) {
    //                         return 'Veuillez entrer une adresse';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                   TextFormField(
    //                     decoration:const InputDecoration(
    //                       labelText: 'Code postal',
    //                     ),
    //                     validator: (value) {
    //                       if (value == null || value.isEmpty) {
    //                         return 'Veuillez entrer un code postal';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                   TextFormField(
    //                     decoration:const InputDecoration(
    //                       labelText: 'Ville',
    //                     ),
    //                     validator: (value) {
    //                       if (value == null || value.isEmpty) {
    //                         return 'Veuillez entrer une ville';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                   TextFormField(
    //                     decoration: const InputDecoration(
    //                       labelText: 'Pays',
    //                     ),
    //                     validator: (value) {
    //                       if (value == null || value.isEmpty) {
    //                         return 'Veuillez entrer un pays';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                   ],
    //                 ),
    //               ),
    //           ],
    //         ),
    //         ),
    //         //fomulaire de paiement
    //         Expanded(
    //           child:
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             const Text('Paiement'),
    //             Form(
    //               child: Column(
    //                 children: [
    //                   TextFormField(
    //                     decoration: const InputDecoration(
    //                       labelText: 'Nom sur la carte',
    //                     ),
    //                     validator: (value) {
    //                       if (value == null || value.isEmpty) {
    //                         return 'Veuillez entrer un nom';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                   TextFormField(
    //                     decoration: const InputDecoration(
    //                       labelText: 'Numéro de carte',
    //                     ),
    //                     validator: (value) {
    //                       if (value == null || value.isEmpty) {
    //                         return 'Veuillez entrer un numéro de carte';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                   TextFormField(
    //                     decoration: const InputDecoration(
    //                       labelText: 'Date d\'expiration',
    //                     ),
    //                     validator: (value) {
    //                       if (value == null || value.isEmpty) {
    //                         return 'Veuillez entrer une date d\'expiration';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                   TextFormField(
    //                     decoration: const InputDecoration(
    //                       labelText: 'Cryptogramme',
    //                     ),
    //                     validator: (value) {
    //                       if (value == null || value.isEmpty) {
    //                         return 'Veuillez entrer un cryptogramme';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                   ElevatedButton(
    //                       child:  const Text('Valider la commande'),
    //                     onPressed: () {
    //                       if (_formKey.currentState!.validate()) {
    //                         setState(() {
    //                           _isLoading = true;
    //                         });
    //                         //envoi des données de paiement
    //                       }
    //                     }
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            // Add padding to center the child in the middle of the screen
            padding: const EdgeInsets.all(32),
            constraints: const BoxConstraints(
              maxWidth: 960,
            ),
            child: Card(
              // Add a border to the card
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Colors.grey)),
              child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Row(
                    children: [
                      // Right column
                      Expanded(
                        child: Column(children: [
                          const Text(
                            "Adresse de livraison",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 32),
                          TextField(
                            controller: _adresseLivraisonController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                              labelText: 'Adresse',
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Row of text fields
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _cpLivraisonController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    labelText: 'Code Postal',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                child: TextField(
                                  controller: _villeLivraisonController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    labelText: 'Ville',
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),

                          const SizedBox(height: 32),

                          const Text(
                            "Adresse de facturation",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 32),
                          TextField(
                            controller: _adresseFacturationController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                              labelText: 'Adresse',
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Row of text fields
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _cpFacturationController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    labelText: 'Code Postal',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                child: TextField(
                                  controller: _villeFacturationController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    labelText: 'Ville',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),

                      // DIVIDER
                      SizedBox(width: 16),
                      const VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      SizedBox(width: 16),

                      // Right column
                      Expanded(
                        child: Column(children: [
                          const Text(
                            "Informations de paiement",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 32),
                          TextField(
                            controller: _numeroCarteController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                              labelText: 'Numéro de carte',
                            ),
                          ),
                          const SizedBox(height: 32),
                          TextField(
                            controller: _nomCarteController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                              labelText: 'Propriétaire de la carte',
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Row of text fields
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _cvcController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    labelText: 'Cryptogramme',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                child: TextField(
                                  controller: _dateFinController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    labelText: 'Date d\'expiration',
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Card(
                                color: const Color.fromARGB(247, 255, 245, 237),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text("Rappel du total : " +
                                      widget.cart.total.toString() +
                                      " €"),
                                ),
                              ),
                            ],
                          ),
//bouton de validation avec insertion on base dans la collection user puis collection commande du resumé de la commande
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });
                                Payment().addCommandeUser(
                                    widget.cart,
                                    DateTime.now(),
                                    _adresseLivraisonController.text,
                                    _cpLivraisonController.text,
                                    _villeLivraisonController.text,
                                    _adresseFacturationController.text,
                                    _cpFacturationController.text,
                                    _villeFacturationController.text,
                                    _numeroCarteController.text,
                                    _cvcController.text,
                                    _dateFinController.text,
                                    _nomCarteController.text);
                              }
                            },
                            child: const Text('Valider la commande'),
                          ),
                        ]),
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}
