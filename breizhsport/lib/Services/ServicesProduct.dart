//Service of product requete firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Ressources/Product.dart';

class ServicesProduct {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Product> products = [];

  void getProducts() async{
    final QuerySnapshot<Map<String, dynamic>> result =
        await _firestore.collection('products').get();
    result.docs.forEach((element) {
      products.add(Product(
          name: element.data()['name'],
          price: element.data()['price'],
          image: element.data()['image']));
    });
  }
}