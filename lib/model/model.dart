class Book {
  final String title;
  final String author;
  final String category;
  final String isbn;
  final String description;
  final bool isAvailable;

  const Book({
    required this.title,
    required this.author,
    required this.category,
    required this.isbn,
    required this.description,
    required this.isAvailable,
  });
}