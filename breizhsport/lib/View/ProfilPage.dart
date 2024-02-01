//profile page for a user in a shopping app

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  User? _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _auth.authStateChanges().listen((user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      //body of profile page
      body: 
      Column(
        children: [
          //user name
          Text(
            _user!.displayName!,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
          //user email
          Text(
            _user!.email!,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
          //user phone number
          Text(
            _user!.phoneNumber!,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),
          )
          ],
          )
      );
      }
}