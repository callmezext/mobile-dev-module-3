import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

// Builder khusus untuk menghilangkan efek animasi transisi halaman
class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // Mengembalikan widget langsung tanpa dibungkus animasi
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perpustakaan Kampus',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
        ),
        // Mematikan animasi transisi untuk semua platform 
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: NoTransitionsBuilder(),
            TargetPlatform.iOS: NoTransitionsBuilder(),
            TargetPlatform.windows: NoTransitionsBuilder(),
            TargetPlatform.macOS: NoTransitionsBuilder(),
            TargetPlatform.linux: NoTransitionsBuilder(),
            TargetPlatform.fuchsia: NoTransitionsBuilder(),
          },
        ),
      ),
      home: const HomePage(),
    );
  }
}