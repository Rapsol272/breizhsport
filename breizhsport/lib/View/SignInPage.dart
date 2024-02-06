import 'package:breizhsport/Controllers/Auth.dart';
import 'package:breizhsport/View/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final Auth _auth = Auth();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Sign In'),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Text(
    //           'Welcome to the Sign In Page!',
    //           style: TextStyle(fontSize: 16),
    //         ),
    //         const SizedBox(height: 16),
    //         TextFormField(
    //           controller: _emailController,
    //           decoration: const InputDecoration(
    //             labelText: 'Email',
    //           ),
    //         ),
    //         const SizedBox(height: 8),
    //         TextFormField(
    //           controller: _passwordController,
    //           decoration: const InputDecoration(
    //             labelText: 'Password',
    //           ),
    //           obscureText: true,
    //         ),
    //         //ajout demande de tel , nom , prenom
    //         const SizedBox(height: 8),
    //         TextFormField(
    //           controller: _phoneController,
    //           decoration: const InputDecoration(
    //             labelText: 'Numéro de téléphone',
    //           ),
    //         ),
    //         const SizedBox(height: 8),
    //         TextFormField(
    //           controller: _firstNameController,
    //           decoration: const InputDecoration(
    //             labelText: 'First Name',
    //           ),
    //         ),
    //         const SizedBox(height: 8),
    //         TextFormField(
    //           controller: _lastNameController,
    //           decoration: const InputDecoration(
    //             labelText: 'Last Name',
    //           ),
    //         ),
    //         const SizedBox(height: 16),
    //         ElevatedButton(
    //           onPressed: () async {
    //             final email = _emailController.text;
    //             final password = _passwordController.text;
    //             final user = await _auth.registerWithEmailAndPassword(
    //                 _firstNameController.text,
    //                 _lastNameController.text,
    //                 _phoneController.text,
    //                 email,
    //                 password);
    //             //si ok redirection vers la page d'accueil sinon message d'erreur
    //             if (user != null) {
    //               Navigator.pop(context);
    //             } else {
    //               ScaffoldMessenger.of(context).showSnackBar(
    //                 SnackBar(content: Text('Erreur de creation de compte')),
    //               );
    //             }
    //           },
    //           child: Text('Sign In'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
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
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(
                            r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+$')),
                      ],
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
                                Text(
                                    "  •  Le mot de passe doit contenir au moins :"),
                                SizedBox(height: 8),
                                Text(
                                    "  •  Le mot de passe doit contenir au moins :"),
                                SizedBox(height: 8),
                                Text(
                                    "  •  Le mot de passe doit contenir au moins :")
                              ],
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
