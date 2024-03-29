import 'package:breizhsport/Controllers/Auth.dart';
import 'package:breizhsport/View/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();

  static bool validateEmail(String input) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(input);
  }
}

class _SignInPageState extends State<SignInPage> {
  final Auth _auth = Auth();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            // Add padding to center the child in the middle of the screen
            padding: const EdgeInsets.all(32),
            constraints: const BoxConstraints(
              maxWidth: 640,
            ),
            child: Card(
              // Add a border to the card
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Colors.grey)),
              child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(children: [
                    const Text(
                      "Créer un compte",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        labelText: 'Adresse mail',
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Row of text fields
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _firstNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                              labelText: 'Prénom',
                            ),
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          child: TextField(
                            controller: _lastNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                              labelText: 'Nom',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        labelText: 'Mot de passe',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 32),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                          color: Color.fromARGB(247, 255, 245, 237),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Le mot de passe doit contenir au moins :"),
                                SizedBox(height: 8),
                                Text("  •  8 caractères"),
                                SizedBox(height: 8),
                                Text("  •  Une majuscule"),
                                SizedBox(height: 8),
                                Text("  •  Un chiffre"),
                                SizedBox(height: 8),
                                Text("  •  1 caractère spécial : *!&%(),;.?# "),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        labelText: 'Confirmation du mot de passe',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () async {
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        final user = await _auth.registerWithEmailAndPassword(
                            _firstNameController.text,
                            _lastNameController.text,
                            _phoneController.text,
                            email,
                            password);
                        //si ok redirection vers la page d'accueil sinon message d'erreur
                        if (user != null) {
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Erreur de creation de compte')),
                          );
                        }
                      },
                      child: const Text('Créer le compte'),
                    ),
                    const SizedBox(height: 32),
                    const Divider(),
                    const SizedBox(height: 32),
                    // row with text buttons to create an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Déjà un compte? "),
                        const SizedBox(width: 32),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text('Se connecter'),
                        ),
                      ],
                    ),
                  ])),
            ),
          ),
        ));
  }
}
