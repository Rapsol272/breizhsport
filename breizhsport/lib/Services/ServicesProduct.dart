//Service of product requete firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Ressources/Product.dart';

class ServicesProduct {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Product> products = [];

  /*Future<Stream<QuerySnapshot<Object?>>?> getProducts(String searchQuery) async{
    final Stream<QuerySnapshot<Map<String, dynamic>>> result =
    await _firestore.collection('products').where("name", arrayContains : searchQuery).get().asStream();
    return result;
  }*/

  Future<Product> getProductByID(String productID) async{
    final QuerySnapshot<Map<String, dynamic>> result =
        await _firestore.collection('products').where("id", isEqualTo: productID).get();
    return Product.fromSnapshot(result.docs[0]);
  }
}