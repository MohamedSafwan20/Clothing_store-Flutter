import 'package:flutter/material.dart';
import 'package:gentleman/widgets/navbar.dart';
import 'package:gentleman/widgets/product_result_card.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [NavBar(), ProductResultCard()],
            ),
          ),
        ),
      ),
    );
  }
}
