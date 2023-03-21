// Classe book
class Book {
  // variabili (late perchè essendo vuote le dichiari dopo)
  late String id;
  late String title;
  late String authors;
  late String description;
  late String editor;
  late String image;

  // costruttore unnamed
  Book(
    this.id,
    this.title,
    this.authors,
    this.description,
    this.editor,
    this.image
  );

  // costruttore con nome from map
  Book.fromMap(Map<String, dynamic> el) {
    id = el['id'];
    title = el['volumeInfo']['title'].toString();
    authors = el['volumeInfo']['authors'] == null ? '' : el['volumeInfo']['authors'].toString();
    description = el['volumeInfo']['description'] == null ? '' : el['volumeInfo']['description'].toString();
    editor = el['volumeInfo']['publisher'] == null ? '' : el['volumeInfo']['publisher'].toString();
    image = el['volumeInfo']['imageLinks']['smallThumbnail'] == null ? '' : el['volumeInfo']['imageLinks']['smallThumbnail'].toString();
  }
}