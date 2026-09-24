import 'package:flutter/material.dart';
import 'detail_page.dart';

// Model diletakkan di sini agar langsung dikenali tanpa import tambahan
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Book> books = const [
    Book(
      title: 'Rekayasa Perangkat Lunak Terstruktur',
      author: 'Arya Dwi Mahendra S.kom, M.kom',
      category: 'Informatika',
      isbn: '978-602-8758-12-0',
      description:
          'Membahas konsep dasar siklus hidup pengembangan perangkat lunak (SDLC), pemodelan UML, hingga implementasi basis data sistem informasi.',
      isAvailable: true,
    ),
    Book(
      title: 'Pemrograman Web Modern dengan Dart & Flutter',
      author: 'Endra Agustin  S.kom, M.kom',
      category: 'Mobile & Web',
      isbn: '978-623-7131-45-1',
      description:
          'Panduan komprehensif membangun antarmuka aplikasi multi-platform modern menggunakan framework Flutter dan bahasa pemrograman Dart.',
      isAvailable: true,
    ),
    Book(
      title: 'Basis Data: Teori dan Praktik MySQL',
      author: 'Daffa Ariby S.kom, M.kom',
      category: 'Basis Data',
      isbn: '978-602-6232-09-9',
      description:
          'Membahas perancangan ERD, normalisasi tabel relasional, serta optimasi query DDL dan DML pada sistem manajemen basis data.',
      isAvailable: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perpustakaan Kampus'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(book: book),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.menu_book, color: Colors.indigo, size: 32),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            book.author,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Chip(
                                label: Text(
                                  book.category,
                                  style: const TextStyle(fontSize: 11),
                                ),
                                padding: EdgeInsets.zero,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              const Spacer(),
                              Text(
                                book.isAvailable ? 'Tersedia' : 'Dipinjam',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: book.isAvailable ? Colors.green : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}