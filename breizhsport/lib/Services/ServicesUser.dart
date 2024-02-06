//Service of product requete firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Ressources/User.dart';

class ServicesProduct {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<User> user = [];

  Future<User> getUserByID(String userID) async {
    final QuerySnapshot<Map<String, dynamic>> result = await _firestore
        .collection('users')
        .where("id", isEqualTo: userID)
        .get();
    return User.fromSnapshot(result.docs[0]);
  }
}
