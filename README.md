# 📚 Perpustakaan Kampus App

Aplikasi katalog dan peminjaman buku perpustakaan kampus berbasis **Flutter** dan **Dart** dengan antarmuka modern **Material 3**.

---

## 🌟 Fitur Aplikasi

- **Katalog Buku Interaktif (Home)**: Menampilkan koleksi buku dalam bentuk *Card* responsif, mencakup gambar sampul (*cover*), judul, penulis, kategori, dan ketersediaan stok.
- **Detail Buku Lengkap**: Rincian nomor ISBN, nama penulis, status rak, sinopsis lengkap, serta sampul beresolusi tinggi.
- **Sistem Navigasi Terstruktur**:
  - Tombol **Kembali**: Menggunakan `Navigator.pop(context)` untuk kembali ke beranda.
  - Tombol **Pinjam Buku**: Menggunakan `Navigator.pushReplacement(...)` untuk mengunci proses transaksi dan mengarahkan langsung ke halaman sukses.
- **Halaman Sukses**: Konfirmasi peminjaman berhasil dengan satu tombol untuk kembali langsung ke halaman beranda.

---

## 📂 Struktur Direktori

```text
lib/
├── pages/
│   ├── home_page.dart       # Beranda & daftar buku
│   ├── detail_page.dart     # Rincian buku & tombol aksi
│   └── success_page.dart    # Status peminjaman berhasil
└── main.dart                # Entry point & tema aplikasi
```

---

## 🛠️ Prasyarat & Teknologi

- **Flutter SDK**: Versi 3.x atau lebih baru
- **Dart SDK**: Versi 3.x atau lebih baru
- **IDE**: Android Studio / VS Code

---

## 🚀 Panduan Menjalankan

1. Pasang dependensi:
```bash
flutter pub get
```

2. Jalankan aplikasi:
- Melalui browser (Chrome):
```bash
flutter run -d chrome
```
- Melalui Emulator / Perangkat:
```bash
flutter run
```
