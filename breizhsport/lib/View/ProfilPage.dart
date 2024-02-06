//profile page for a user in a shopping app

import 'package:breizhsport/Components/text_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Edit $field",
                  style: const TextStyle(color: Colors.white)),
              content: TextField(
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Enter new $field",
                    hintStyle: const TextStyle(color: Colors.grey)),
                onChanged: (value) {
                  newValue = value;
                },
              ),
              actions: [
                TextButton(
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () => Navigator.pop(context)),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(newValue),
                    child: const Text(
                      'Save changes',
                      style: TextStyle(color: Colors.green),
                    ))
              ],
            ));

    if (newValue.trim().isNotEmpty) {
      await usersCollection.doc(currentUser.uid).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(currentUser.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.exists) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return ListView(
                children: [
                  const SizedBox(height: 50),
                  const Icon(Icons.person, size: 72),
                  const SizedBox(height: 10),
                  Text(
                    currentUser.email!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        'My details',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  TextBox(
                      text: userData['name'],
                      sectionName: 'name',
                      onPressed: () => editField('name')),
                  TextBox(
                      text: userData['phone'],
                      sectionName: 'phone',
                      onPressed: () => editField('phone')),
                  TextBox(
                      text: userData['prenom'],
                      sectionName: 'prenom',
                      onPressed: () => editField('prenom')),
                  const SizedBox(height: 50),
                  Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        'Mes commandes',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error${snapshot.error}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
