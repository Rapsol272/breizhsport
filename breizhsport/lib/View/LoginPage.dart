import 'package:flutter/material.dart';
import '../Controllers/Auth.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Auth _auth = Auth();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () async {
                final email = _emailController.text;
                final password = _passwordController.text;
                final user = await _auth.signInWithEmailAndPassword(email, password);
                if (user != null) {
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid email or password')),
                  );
                }
              },
            ),
            SizedBox(height: 16),
            TextButton(
              child: Text('Create Account'),
              onPressed: () async {
                final email = _emailController.text;
                final password = _passwordController.text;
                final user = await _auth.createUserWithEmailAndPassword(email, password);
                if (user != null) {
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error creating account')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
