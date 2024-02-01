import 'package:firebase_auth/firebase_auth.dart';
import 'DatabaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final instanceFirestore = FirebaseFirestore.instance.collection("users");

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  User? _userFromFirebaseUser(User? user) {
    return user;
  
  }

 Future registerWithEmailAndPassword(String name, String prenom, String phone ,String email, String password) async {
    try {
      UserCredential result =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if (user == null) {
        throw Exception("No user found");
      } else {
        await DatabaseService( uid: user.uid).saveUser(name, prenom, email, phone );

        return _userFromFirebaseUser(user);
      }
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }

//creation d'un compte firebase avec email et password et creation du user dans la base de donnée
  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      //creation du user dans la base de donnée

      return result.user;
    } catch (e) {
      print('Error creating user: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}