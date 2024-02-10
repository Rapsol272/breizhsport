import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> saveUser(String name, String prenom, String email, String phone) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'prenom': prenom,
      'email': email,
      'phone': phone,
    });
  }

  Future<void> updateUser(String name, String prenom, String email, String phone) async {
    return await userCollection.doc(uid).update({
      'name': name,
      'prenom': prenom,
      'email': email,
      'phone': phone,
    });
  }


  Future<void> deleteUser() async {
    return await userCollection.doc(uid).delete();
  }

}