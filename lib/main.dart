// IMPORTS
import 'package:flutter/material.dart';

void main() {
  runApp(const RootApp());
}

// Root App
class RootApp extends StatelessWidget {
  // costruttore
  const RootApp({super.key});

  // cosa visualizzare nell'interfaccia grafica
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ricerca Libri',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Text('Home')
    );
  }
}