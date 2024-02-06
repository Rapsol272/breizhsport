import 'package:breizhsport/Controllers/Auth.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Sign In Page!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            //ajout demande de tel , nom , prenom
            const SizedBox(height: 8),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Numéro de téléphone',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            const SizedBox(height: 16),
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
                    SnackBar(content: Text('Erreur de creation de compte')),
                  );
                }
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
