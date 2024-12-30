import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'package:bericot/login.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initialize Firebase
  runApp(const TheStockApp());
}

class TheStockApp extends StatelessWidget {
  const TheStockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      
    );
  }
}

void addProduct(String name, int quantity, double price) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  await firestore.collection('products').add({
    'name': name,
    'quantity': quantity,
    'price': price,
  });
}
