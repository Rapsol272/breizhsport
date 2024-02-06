import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String prenom;
  final String phone;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.prenom,
      required this.phone});

  static User fromSnapshot(DocumentSnapshot doc) {
    return User(
      id: doc.id, //int
      name: doc.data().toString().contains('name')
          ? doc.get('name')
          : '', //String
      email: doc.data().toString().contains('email')
          ? doc.get('email')
          : '', //String
      prenom: doc.data().toString().contains('prenom')
          ? doc.get('prenom')
          : '', //String
      phone: doc.data().toString().contains('phone')
          ? doc.get('phone')
          : '', //String
    );
  }
}
