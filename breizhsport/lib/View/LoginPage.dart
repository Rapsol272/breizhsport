import 'package:flutter/material.dart';
import '../Controllers/Auth.dart';
import 'SignInPage.dart';

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
      appBar: AppBar(),
      // body: Card(
      //     child: Padding(
      //         padding: EdgeInsets.all(32),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             TextField(
      //               controller: _emailController,
      //               decoration: InputDecoration(
      //                 labelText: 'Email',
      //               ),
      //             ),
      //             SizedBox(height: 16),
      //             TextField(
      //               controller: _passwordController,
      //               decoration: InputDecoration(
      //                 labelText: 'Password',
      //               ),
      //               obscureText: true,
      //             ),
      //             SizedBox(height: 16),
      //             ElevatedButton(
      //               child: Text('Sign In'),
      //               onPressed: () async {
      //                 final email = _emailController.text;
      //                 final password = _passwordController.text;
      //                 final user = await _auth.signInWithEmailAndPassword(
      //                     email, password);
      //                 if (user != null) {
      //                   Navigator.pop(context);
      //                 } else {
      //                   ScaffoldMessenger.of(context).showSnackBar(
      //                     SnackBar(
      //                         content: Text('Invalid email or password')),
      //                   );
      //                 }
      //               },
      //             ),
      //             SizedBox(height: 16),
      //             TextButton(
      //               child: Text('Create Account'),
      //               onPressed: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(builder: (context) => SignInPage()),
      //                 );
      //               },
      //             ),
      //           ],
      //         )))
      body: Container(
        constraints: const BoxConstraints(
          maxWidth: 640,
        ),
        child: Card(
          child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(children: [
                const Text(
                  "Se connecter",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.logout),
                      Text('Se connecter'),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final user =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (user != null) {
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "L'adresse email ou le mot de passe est incorrect.")),
                      );
                    }
                  },
                ),
                const Divider(),
              ])),
        ),
      ),
    );
  }
}
