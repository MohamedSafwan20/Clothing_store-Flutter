import 'package:flutter/material.dart';
import 'package:gentleman/config/db.dart';
import 'package:gentleman/screens/home.dart';
import 'package:gentleman/screens/login.dart';
import 'package:gentleman/screens/product_result.dart';
import 'package:gentleman/screens/search.dart';
import 'package:gentleman/screens/signup.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initializing Firestore
    initializeFirebase();

    return MaterialApp(
      routes: {
        "/": (context) => const Home(),
        "/signup": (context) => const Signup(),
        "/login": (context) => const Login(),
        "/search": (context) => const Search(),
        "/product-result": (context) => const ProductResult(),
      },
      initialRoute: "/product-result",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        indicatorColor: const Color(0xFF27D308),
        disabledColor: const Color(0xFFB5B5B5),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(
          primary: const Color(0xFF262525),
          secondary: const Color(0xffeaa53b),
          error: const Color(0xFFE21414),
        ),
      ),
    );
  }
}
