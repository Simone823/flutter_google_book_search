// IMPORTS
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// lib
import 'book.dart';

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
    debugShowCheckedModeBanner: false,
      title: 'Ricerca Libri',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LibriScreen()
    );
  }
}


// Classi libri screen
class LibriScreen extends StatefulWidget {
  // costruttore
  const LibriScreen({super.key});

  @override
  State <LibriScreen> createState() => _LibriScreenState();
}

class _LibriScreenState extends State<LibriScreen> {
  // init state
  @override
  void initState() {
    searchBooks('Oceano Mare');
    super.initState();
  }

  // risultato
  String result = "";

  // libri
  List<Book> libri = [];

  // cerca libri
  Future searchBooks(String ricerca) async {
    // scomposizione url
    const dominio = 'www.googleapis.com';
    const percorso = '/books/v1/volumes';

    // query ricerca
    Map <String, dynamic> params = {
      'q': ricerca
    };

    // url finale
    final Uri url = Uri.https(dominio, percorso, params);

    // get data
    http.get(url).then((res) {
      // json decode
      final resJson = jsonDecode(res.body);

      // data res
      final data = resJson['items'];

      // libri
      final books = data.map((book) => Book.fromMap(book)).toList();

      // set state
      setState(() {
        result = res.body;
        libri = books;
      });
    });

    setState(() {
      result = 'Richiesta in corso';
    });
  }

  // cosa visualizzare nell'interfaccia grafica
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Libri',
          style: TextStyle(
            fontWeight: FontWeight.bold
          )
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Text(result),
      ),
    );
  }
}