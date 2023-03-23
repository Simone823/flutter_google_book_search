import 'package:flutter/material.dart';

// class
import 'book.dart';

class BookScreen extends StatelessWidget {
  // variabili
  final Book book;

  // costruttore
  const BookScreen(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20), 
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.network(book.image)
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text('Scritto da ${book.authors}', style: const TextStyle(fontSize: 20, color: Colors.white))
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text('Editore ${book.editor}', style: const TextStyle(fontSize: 20, color: Colors.white))
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(book.description, style: const TextStyle(fontSize: 16, color: Colors.white))
              )
            ]
          )
        )
      )
    );
  }
}