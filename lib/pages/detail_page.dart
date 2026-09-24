import 'package:flutter/material.dart';
import 'home_page.dart'; // Mengambil class Book dari home_page.dart
import 'success_pages.dart';

class DetailPage extends StatelessWidget {
  final Book book;

  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  TAMPILAN COVER BUKU 
            Center(
              child: Container(
                width: 140,
                height: 190,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade700,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.menu_book,
                      color: Colors.white,
                      size: 48,
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        book.category,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: book.isAvailable ? Colors.green.shade100 : Colors.red.shade100,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                book.isAvailable ? 'Tersedia di Rak' : 'Sedang Dipinjam',
                style: TextStyle(
                  color: book.isAvailable ? Colors.green.shade800 : Colors.red.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              book.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Penulis: ${book.author}',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            Text(
              'ISBN: ${book.isbn}',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const Divider(height: 32),
            const Text(
              'Deskripsi / Sinopsis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              book.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Kembali'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: book.isAvailable
                        ? () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SuccessPage(bookTitle: book.title),
                              ),
                            );
                          }
                        : null,
                    child: const Text('Pinjam Buku'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}