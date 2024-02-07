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
        appBar: AppBar(
          title: const Text('Validation de la commande'),
        ),
        body: Center(
            child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(
            maxWidth: 840,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 16),
            const Text(
              "Se connecter",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              // Add a border to the card
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(),
                    const SizedBox(width: 16),
                    Column(),
                    const VerticalDivider(
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    Column(),
                  ],
                ),
              ),
            )
          ]),
        )));
  }
}
