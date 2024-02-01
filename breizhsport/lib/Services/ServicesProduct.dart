//Service of product requete firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Ressources/Product.dart';

class ServicesProduct {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Product> products = [];

  Future<List<Product>> getProducts(String searchQuery) async{
    final QuerySnapshot<Map<String, dynamic>> result =
    await _firestore.collection('products').where("name", arrayContains : searchQuery).get();
    if(result.docs.isEmpty){
      return products;
    }
    else
    {
      result.docs.forEach((element) {
      products.add(Product(
          id: element.data()['id'],
          name: element.data()['name'],
          price: element.data()['price'],
          description: element.data()['description'],
          image: element.data()['image']));
    });
    return products;
    }
  }

  Future<Product> getProduct(int productID) async{
    final QuerySnapshot<Map<String, dynamic>> result =
        await _firestore.collection('products').get();
        if(result.docs.isEmpty){
          return Product(id: 0 , name: 'error', price: 0 , description: "error");
        }
        else
        {
          return Product(
              id: result.docs[productID].data()['id'],
              name: result.docs[productID].data()['name'],
              price: result.docs[productID].data()['price'],
              description: result.docs[productID].data()['description'],
              image: result.docs[productID].data()['image']);
              }
  }
}