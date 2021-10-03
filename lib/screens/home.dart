import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gentleman/widgets/category_chips.dart';
import 'package:gentleman/widgets/navbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [NavBar(), CategoryChips()],
            ),
          ),
        ),
      ),
    );
  }
}
