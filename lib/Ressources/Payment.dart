//creation des fonction pour : insertion on base dans la collection user puis collection commande du resumé de la commande


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:breizhsport/Ressources/Cart.dart';

class Payment {
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('user');
  User? user = FirebaseAuth.instance.currentUser;
  late final CollectionReference instanceFirestore;

  void initializeInstanceFirestore() {
    instanceFirestore = FirebaseFirestore.instance.collection("users").doc(user!.uid).collection('commande');
  }
//                                 Payment().addCommandeUser(widget.cart , DateTime.now(), _adresseLivraisonController.text, _cpLivraisonController.text, _villeLivraisonController.text, _adresseFacturationController.text, _cpFacturationController.text, _villeFacturationController.text, _numeroCarteController.text, _cvcController.text, _dateFinController.text, _nomCarteController.text);

  Future<void> addCommandeUser(Cart cart, DateTime timenow , String adresseLivraison, String cpLivraison, String villeLivraison, String adresseFacturation, String cpFacturation, String villeFacturation, String numeroCarte, String cvc, String dateFin, String nomCarte) async {
    if (user == null) {
      throw Exception("No user found");
    } else {
      instanceFirestore = FirebaseFirestore.instance.collection("users").doc(user!.uid).collection('commande');
      String idCommande = instanceFirestore.doc().id;
      await instanceFirestore.doc(idCommande).set({
        'TotalPrice': cart.total,
        'Date': timenow,
        'name': user!.displayName,
        'email': user!.email,
        'phone': user!.phoneNumber,
        'cart': cart.totalQuantity,
        'adresseLivraison': adresseLivraison,
        'cpLivraison': cpLivraison,
        'villeLivraison': villeLivraison,
        'adresseFacturation': adresseFacturation,
        'cpFacturation': cpFacturation,
        'villeFacturation': villeFacturation,
        'numeroCarte': numeroCarte,
        'cvc': cvc,
        'dateFin': dateFin,
        'nomCarte': nomCarte,
      });
      
      
      //on ajoute maitenant dans la collection comande une collection produit
      for (var i = 0; i < cart.items.length; i++) {
        await instanceFirestore.doc(idCommande).collection('produit').doc().set({
          'name': cart.items[i].name,
          'price': cart.items[i].price,
          'quantity': cart.items[i].quantity,
          'image': cart.items[i].image,
          'id': cart.items[i].id,
        });
      }
    }
  }
}