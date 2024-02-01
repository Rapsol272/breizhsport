import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'View/HomePage.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
 options: const FirebaseOptions(
  apiKey: "AIzaSyChKtZaz6swMZggnAVjH6OiF_gS5nexJWM",
  appId: "1:844924763243:android:b69184c89ab55790e5052e",
  messagingSenderId: "",
  projectId: "breizhsport-b1f64")
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breizhsport',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFD84727)),
      ),
      home: HomePage(),
    );
  }
}



