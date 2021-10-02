import 'package:flutter/material.dart';
import 'package:gentleman/config/db.dart';
import 'package:gentleman/screens/home.dart';

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
      home: const Home(),
    );
  }
}
